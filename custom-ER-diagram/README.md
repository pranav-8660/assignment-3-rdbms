## Please refer to the below mentioned Google Drive file to redirect to the draw.io page ->
- https://drive.google.com/file/d/1ixe6TBtXp4I7BGLy7b1YqX_t2T4Emop4/view?usp=drive_link

### I have chosen to draw the ER-Diagram of a simple Flight Booking Portal

---

### Entities and Attributes

#### 1. Passenger
- **Passenger_ID** (Primary Key)  
- Passenger_Name  
- Passenger_Email_ID  
- Passenger_DOB  
- Passenger_Phone_No  

#### 2. Flight
- **Flight_ID** (Primary Key)  
- Flight_Name  
- Source  
- Destination  
- Departure_Time  
- Arrival_Time  

#### 3. Booking
- **Booking_ID** (Primary Key)  
- Booking_Date  
- Booking_Status  
- Seat_Number  
- Passenger_ID (Foreign Key → Passenger)  
- Flight_ID (Foreign Key → Flight)  

#### 4. Payment
- **Payment_ID** (Primary Key)  
- Payment_Amount  
- Payment_DateTime  
- Payment_Method  
- Passenger_ID (Foreign Key → Passenger)  
- Booking_ID (Foreign Key → Booking)  

---

### Relationships & Cardinalities
- A **Passenger** makes many **Bookings** (1 : M)  
- A **Flight** has many **Bookings** (1 : M)  
- A **Booking** has one **Payment** (1 : 1)  
