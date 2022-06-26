from fastapi import FastAPI, status, HTTPException, Depends, Form, Query
from fastapi.middleware.cors import CORSMiddleware
from models import User, Sort, Record
from config import config, PAGE_SIZE
import mysql.connector
import os


app = FastAPI()
app.add_middleware(CORSMiddleware, **config['CORS'])
db = mysql.connector.connect(**config['database'])
cursor = db.cursor(dictionary=True)


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
        return user
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
    try:
        cursor.execute(
            'INSERT INTO catatan_perjalanan (tanggal, waktu, lokasi, suhu_tubuh, NIK) VALUES(%s, %s, %s, %s, %s)',
            (record_data.tanggal, record_data.waktu, record_data.lokasi, record_data.suhu_tubuh, user['NIK'])
        )
        print(db.commit())
        return {'message': 'added new record'}
    except:
        raise HTTPException(status_code=400, detail="Invalid Value submitted")


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
async def get_catatan_perjalanan(pagenum: int = 0, pagesize: int = 5, sortdatafield: str | None = None, sortorder: str | None = None, user: list = Depends(get_user)):
    start = pagenum * pagesize
    query = "SELECT SQL_CALC_FOUND_ROWS tanggal, waktu, lokasi, suhu_tubuh FROM catatan_perjalanan WHERE NIK=%s LIMIT %s, %s"
    if sortdatafield is not None: 
        if sortorder == "desc": 
            query =  f"SELECT SQL_CALC_FOUND_ROWS tanggal, waktu, lokasi, suhu_tubuh FROM catatan_perjalanan WHERE NIK=%s ORDER BY {sortdatafield} DESC LIMIT %s, %s"
        elif sortorder == "asc": 
            query =  f"SELECT SQL_CALC_FOUND_ROWS tanggal, waktu, lokasi, suhu_tubuh FROM catatan_perjalanan WHERE NIK=%s ORDER BY {sortdatafield} ASC LIMIT %s, %s"
    cursor.execute(query, (user['NIK'], start, pagesize))
    data = {"Rows": cursor.fetchall()}
    cursor.execute("SELECT FOUND_ROWS() AS total_rows")
    data.update({"TotalRows": cursor.fetchall()[0]['total_rows']})
    return data


if __name__ == "__main__":
    os.system('uvicorn main:app --reload')
