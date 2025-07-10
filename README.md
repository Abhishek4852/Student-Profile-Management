# 🎓 Student Profile Management System

The **Student Profile Management System** is a responsive web-based application built using **JSP, Servlets, JDBC, and MySQL**. It allows users to manage student records efficiently, providing features like login authentication, CRUD operations for student data, and a mobile-friendly UI using **Bootstrap 5**.

This project is ideal for students and beginners looking to learn full-stack Java web development with deployment via Docker on **Render**.

---

## ✅ Features

- 🔐 User login with session validation
- ➕ Add new student profiles
- 📋 View all registered students in a table
- ✏️ Edit student details
- ❌ Delete student profiles
- 🌐 Responsive layout using Bootstrap 5
- ☁️ Deployable as a WAR file using Docker and Tomcat on Render

---

## 🛠 Tech Stack

**Frontend:**
- JSP (JavaServer Pages)
- HTML5, CSS3
- Bootstrap 5

**Backend:**
- Java Servlets
- JDBC (Java Database Connectivity)
- MySQL

**Deployment:**
- Apache Tomcat 10
- Docker
- Render (cloud deployment)

---

## 📁 Project Structure

Student-Profile-Management/
├── Dockerfile # Docker configuration for Render deployment
├── student.war # Final WAR file for deployment
├── src/
│ ├── dao/ # Data Access Layer
│ │ └── StudentDao.java
│ ├── model/ # Student entity
│ │ └── Student.java
│ └── servlets/ # Servlet classes (login, register, CRUD)
├── WebContent/
│ ├── index.jsp # Login page
│ ├── home.jsp # Dashboard
│ ├── addStudent.jsp # Add student form
│ ├── viewStudents.jsp # View students table
│ ├── register.jsp # Register page
│ ├── navbar.jsp # Common navbar
│ ├── footer.jsp # Common footer
│ └── WEB-INF/
│ └── web.xml # Deployment descriptor



---

## 👨‍💻 Author

**Abhishek Yaduwanshi**  
📍 Indore, India  
📧 abhishekyaduvanshi@gmail.com  
🔗 [GitHub](https://github.com/Abhishek4852)  
🎓 MCA Student | Java & Web Developer | Open Source Enthusiast

---

> © 2025 Student Profile Management System — All Rights Reserved.
