# Business Socials Centralised Data Application

This project is a web application hosted on AWS using free-tier resources. It includes a React/Next.js frontend, a FastAPI or Node.js backend, and Terraform for infrastructure management. The application is integrated with a CI/CD pipeline for automated deployment.

## 🎯 Purpose

This application tackles the common issue of **missed notifications and fragmented communication** across multiple apps and devices. By consolidating messages, mentions, and notifications in one place, it ensures you never miss an important update or customer inquiry again.

## ✅ Key Benefits

- 📥 Centralised dashboard for business social media and email accounts  
- 🚫 Reduced reliance on error-prone mobile app notifications  
- ⚡ Increased productivity and responsiveness  
- 📊 Simplified monitoring and management of business interactions

## Project Structure

```
business-socials-app/
│
├── frontend/                    # React/Next.js app
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   └── styles/
│   ├── .env.local
│   └── package.json
│
├── backend/                     # FastAPI
│   ├── app/
│   │   ├── routes/
│   │   ├── services/
│   │   └── utils/
│   ├── main.py (Using FastAPI)
│   ├── requirements.txt (or package.json)
│   └── .env
│
├── infrastructure/             # Terraform files
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── .github/workflows/          # CI/CD pipelines
│   ├── backend.yml
│   └── frontend.yml
│
├── README.md
└── .gitignore
```

## Getting Started

### Prerequisites
- Node.js and npm
- Python (if using FastAPI)
- Terraform
- AWS CLI

### Setup
1. Clone the repository.
2. Navigate to the `frontend` and `backend` directories to install dependencies.
3. Configure AWS credentials for Terraform.
4. Deploy the infrastructure using Terraform.
5. Start the frontend and backend services locally for development.

### CI/CD
The `.github/workflows/` directory contains GitHub Actions workflows for automating the deployment of the frontend and backend.

---

> _Stay on top of your business communication — all in one place._

