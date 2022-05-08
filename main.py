from fastapi import FastAPI, status, HTTPException, Depends, Form, Query
from fastapi.middleware.cors import CORSMiddleware
from models import User, Sort, Record
from config import config, PAGE_SIZE
import mysql.connector
import os


app = FastAPI()
app.add_middleware(CORSMiddleware, **config['CORS'])
db = mysql.connector.connect(**config['database'])
cursor = db.cursor()


def get_user(NIK:str = Query(..., regex='^[0-9]+$', max_length=16, min_length=16)):
    cursor.execute('SELECT * FROM user WHERE NIK=%s', (NIK, ))
    user_info = cursor.fetchone()
    print(user_info)
    if user_info is not None:
        return user_info
    raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='user tidak ditemukan!.')


@app.post('/login')
def login(user: User):
    cursor.execute('SELECT * FROM user WHERE NIK=%s AND nama=%s', (user.NIK, user.nama, ))
    if cursor.fetchone() is not None:
        return user.NIK
    raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail='user tidak ditemukan!.')


@app.put('/edit_user')
def edit_user(user: list = Depends(get_user), nama: str = Form(..., max_length=50, min_length=3),
              profile: str | None = Form(None)):
    cursor.execute('UPDATE user SET nama=%s, profile=%s WHERE NIK=%s', (nama, profile, user[0]))
    db.commit()
    return {
        'message': f'successfully updated {user[0]}'
                   f'{" nama: "+nama if nama is not None else ""}{" profile: "+profile if profile is not None else ""}'
    }


@app.post('/add_records')
def add_records(record_data: Record, user: list = Depends(get_user)):
    cursor.execute(
        'INSERT INTO catatan_perjalanan (tanggal, waktu, lokasi, suhu_tubuh, NIK) VALUES(%s, %s, %s, %s, %s)',
        (record_data.tanggal, record_data.waktu, record_data.lokasi, record_data.suhu_tubuh, user[0])
    )
    db.commit()
    return {'message': 'added new record'}


@app.post('/new_user')
def new_user(user: User):
    cursor.execute('SELECT NIK FROM user WHERE NIK=%s OR nama=%s', (user.NIK, user.nama))
    if cursor.fetchone() is None:
        cursor.execute('INSERT INTO user (NIK, nama, profile) VALUES (%s, %s, %s)',
                       (user.NIK, user.nama, user.profile))
        db.commit()
        return {'message': f'user dengan NIK: {user.NIK} dan Nama: {user.nama} berhasil dibuat!'}
    raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,
                        detail=f'user dengan NIK: {user.NIK} atau Nama: {user.nama} sudah terdaftar!')


@app.get('/records')
async def get_catatan_perjalanan(page: int = 1, user: list = Depends(get_user), cari: str | None = None,
                                 tanggal: Sort | None = None, waktu: Sort | None = None,
                                 suhu_tubuh: Sort | None = None):
    sorters = {'tanggal': tanggal, 'waktu': waktu, 'suhu_tubuh': suhu_tubuh}
    print(tanggal)
    sql = f'''SELECT * FROM catatan_perjalanan WHERE NIK=%(NIK)s 
    {'AND (tanggal LIKE %(cari)s OR waktu LIKE %(cari)s OR lokasi LIKE %(cari)s)' if cari is not None else ' '}
    ORDER BY'''
    for sorter, order in sorters.items():
        if order is not None:
            sql += f' {sorter} {order.value},'
    if sql.endswith('ORDER BY'):
        sql = sql.replace('ORDER BY', '')
    sql = sql.rstrip(', ')
    sql += ' LIMIT %(page_size)s OFFSET %(page)s'
    print(sql)
    print(tanggal)
    data = {'cari': f'%{cari}%', 'NIK': user[0]} if cari is not None else {'NIK': user[0]}
    data.update({'page_size': PAGE_SIZE, 'page': (page-1)*PAGE_SIZE})
    cursor.execute(sql, data)
    records = cursor.fetchall()
    if not records and page > 1:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail='Page Not Found 404 Error ! ')
    return {'catatan_perjalanan': records}


if __name__ == "__main__":
    os.system('uvicorn main:app --reload')
