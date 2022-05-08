from fastapi.testclient import TestClient
from main import app
import mysql.connector
from config import config


db = mysql.connector.connect(**config['database'])
cursor = db.cursor()
client = TestClient(app)

user1 = {'NIK': '1213141516171819', 'nama': 'just anything i wanted'}
user2 = {
        'NIK': '2223242526272829',
        'nama': 'just another thing i wanted',
        'profile': 'some path XD'
}
user3 = {
    'NIK': '11111111s111111a',
    'nama': 'test user 3',
    'profile': 'some path wkwkwk'
}

user4 = {
    'NIK': '11111111111111111',
    'nama': 'to loongggg',
    'profile': 'damn'
}

user5 = {
    'NIK': '11111',
    'nama': 'tooo small',
    'profile': 'damn damn'
}

cursor.executemany('DELETE FROM user WHERE NIK=%s', [(user1['NIK'], ), (user2['NIK'], )])
db.commit()
db.close()


def test_new_user_without_profile():
    response = client.post('/new_user', json=user1)
    assert response.status_code == 200
    assert response.json() == {
        'message': f'user dengan NIK: {user1["NIK"]} dan Nama: {user1["nama"]} berhasil dibuat!'
    }


def test_new_user_complete():
    response = client.post('/new_user', json=user2)

    assert response.status_code == 200
    assert response.json() == {
        'message': f'user dengan NIK: {user2["NIK"]} dan Nama: {user2["nama"]} berhasil dibuat!'
    }


def test_new_user_nik_with_alpha():
    response = client.post('/new_user', json=user3)

    assert response.status_code != 200


def test_new_user_nik_longer():
    response = client.post('/new_user', json=user4)

    assert response.status_code != 200


def test_new_user_nik_shorter():
    response = client.post('/new_user', json=user5)

    assert response.status_code != 200


def test_new_user_exsited():
    response = client.post('new_user', json=user2)
    assert response.status_code == 401


def test_login_full():
    response = client.post('/login', json=user2)
    assert response.status_code == 200
    assert response.json() == user2['NIK']


def test_login_no_nama():
    response = client.post('/login', json={'NIK': '1111111111111111'})

    assert response.status_code == 422


def test_login_no_nik():
    response = client.post('/login', json={'name': 'AIRELL'})

    assert response.status_code == 422


def test_login_empty():
    response = client.post('/login')

    assert response.status_code == 422


def test_edit_user():
    response = client.put(f'/edit_user?NIK={user1["NIK"]}', data={'nama': 'bambang ini bambang', 'porfile': 'auah'})
    assert response.status_code == 200
    assert response.json() is not None


def test_edit_user_empty():
    response = client.put(f'/edit_user?NIK={user1["NIK"]}')
    assert response.status_code == 422


def test_get_catatan_perjalanan():
    response = client.get(f'/records?NIK={user1["NIK"]}')
    assert response.status_code == 200


def test_get_catatan_perjalanan_page_out_of_range():
    response = client.get('/records?page=2&NIK=1111111111111111')
    assert response.status_code == 404
