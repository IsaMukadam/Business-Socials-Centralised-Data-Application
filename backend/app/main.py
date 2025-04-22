from fastapi import FastAPI
from app.routes import status

app = FastAPI()
app.include_router(status.router)

@app.get("/")
def read_root():
    return {"message": "Welcome to Business Socials Hub!"}
