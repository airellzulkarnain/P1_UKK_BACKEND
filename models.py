from pydantic import BaseModel, Field
from enum import Enum
import datetime


class User(BaseModel):
    NIK: str = Field(..., min_length=16, max_length=16, regex='^[0-9]+$')
    nama: str
    profile: str | None = None


class Record(BaseModel):
    tanggal: str = str(datetime.date.today())
    waktu: str = str(datetime.datetime.now().time())[:8]
    lokasi: str | None = Field(None, max_length=100)
    suhu_tubuh: float


class Sort(str, Enum):
    asc = "ASC"
    desc = "DESC"
