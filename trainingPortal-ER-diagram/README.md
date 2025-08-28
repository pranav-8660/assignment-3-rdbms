## Please refer to the below mentioned Google Drive file to redirect to the draw.io page ->

- https://drive.google.com/file/d/1C1zEquuY1_Wfvj4sT8a7jj7VPvYp65ta/view?usp=sharing

###  the ER-Diagram of a Training/Learning Management Portal

---

### Entities and Attributes

#### 1. Users
- **User_ID** (Primary Key)  
- Name  
- Email  
- Password  
- Role (Learner / Trainer / Manager)  
- Department_ID (Foreign Key → Departments)  

#### 2. Departments
- **Department_ID** (Primary Key)  
- Department_Name  
- Location  

#### 3. Trainers
- **Trainer_ID** (Primary Key)  
- Name  
- Specialization  
- Manager_ID (Foreign Key → Trainers.Trainer_ID)  

#### 4. Courses
- **Course_ID** (Primary Key)  
- Title  
- Description  
- Duration  
- Trainer_ID (Foreign Key → Trainers)  
- Department_ID (Foreign Key → Departments)  

#### 5. Users-Course (Mapping)
- **User_Course_ID** (Primary Key)  
- User_ID (Foreign Key → Users)  
- Course_ID (Foreign Key → Courses)  
- Enrollment_Date  
- Status  

#### 6. Payment
- **Payment_ID** (Primary Key)  
- User_ID (Foreign Key → Users)  
- Course_ID (Foreign Key → Courses)  
- Amount  
- Payment_Date  
- Status  

#### 7. Preassessment
- **Preassessment_ID** (Primary Key)  
- Course_ID (Foreign Key → Courses)  
- User_ID (Foreign Key → Users)  
- Score  
- Date_Taken  

#### 8. Training Materials
- **Material_ID** (Primary Key)  
- Course_ID (Foreign Key → Courses)  
- Type (Video / Visual / Notes)  
- Title  
- Content_Link  

#### 9. Assessments
- **Assessment_ID** (Primary Key)  
- Course_ID (Foreign Key → Courses)  
- User_ID (Foreign Key → Users)  
- Score  
- Date_Taken  

#### 10. Feedback / Reviews
- **Feedback_ID** (Primary Key)  
- Course_ID (Foreign Key → Courses)  
- User_ID (Foreign Key → Users)  
- Rating  
- Comments  
- Date_Given  

---

### Relationships & Cardinalities
- A **Department** has many **Users** (1 : M)  
- A **Department** offers many **Courses** (1 : M)  
- A **Trainer** conducts many **Courses** (1 : M)  
- A **Trainer** may be managed by another **Trainer** (1 : 1, recursive)  
- A **User** enrolls in many **Courses** (M : N via Users-Course)  
- A **User** makes many **Payments** (1 : M)  
- A **Course** has many **Payments** (1 : M)  
- A **Course** has many **Preassessments** (1 : M)  
- A **User** attempts many **Preassessments** (1 : M)  
- A **Course** contains many **Training Materials** (1 : M)  
- A **Course** has many **Assessments** (1 : M)  
- A **User** attempts many **Assessments** (1 : M)  
- A **User** gives many **Feedback/Reviews** (1 : M)  
- A **Course** receives many **Feedback/Reviews** (1 : M)  
