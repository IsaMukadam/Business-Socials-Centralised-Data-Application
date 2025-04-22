from fastapi import APIRouter

router = APIRouter()

@router.get("/status")
def check_status():
    return {"status": "OK"}

@router.get("/users")
def get_users():
    return [{"id": 1, "name": "John Doe"}, {"id": 2, "name": "Jane Smith"}]

@router.post("/submit")
def submit_data(data: dict):
    return {"status": "success", "data": data}