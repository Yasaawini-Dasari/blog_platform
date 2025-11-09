# Blog Platform

 A blogging platform built using "RUBY ON RAILS" & "PostgreSQL" where we can:

- Sign up, Login, Logout using Devise  
- Create / Edit(update) / Delete / View their own blog posts only
- user can also Import posts from CSV file and 
- Download particular posts as PDF  

---

## Tech Stack
- Ruby 3.x  
- Ruby on Rails 7.x  
- PostgreSQL  
- Devise (authentication)  
- Prawn (PDF generation)  

---

## Setup Instructions

### 1 Clone repository
```bash 
git clone <https://github.com/Yasaawini-Dasari/blog_platform>
cd blog_platform 

2 Install dependencies

bundle install

3 Setup database

rails db:create
rails db:migrate

4 Start the server

rails server

5 visit in browser 

http://localhost:3000

6 Features included 

--> Authentication using devise (session based access)
   - Sign Up 
   - Login 
   - Logout

--> CRUD Opearations (POSTS)
    - Create a post 
    - Edit a post 
    - Delete a post
    - View user posts only 
    - Each post contain -> Title and Content 

--> CSV Import 
   - choose file --> to choose csv file from local system
   - Upload CSV to create multiple posts
   - CSV format must include title and content 

--> PDF Download 
   - Inside (show view) posts user can download invidual post as PDF for all their own posts only

7 Commands Used 

  - Install gems   --> bundle install
  - Create DB      --> rails db:create
  - Migrate DB     --> rails dv:migrate 
  - Start Server   --> rails server


8 Folder Structure 

 app/
 ├── controllers/
 ├── models/
 ├── views/
 └── ...


