import sqlite3
import os

# Get the base path of the project
base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
db_name = os.path.join(base_path, "mare_kwenta.db")

# check if the database file exists
if not os.path.exists(db_name):
    print("Database doesn't exist. Creating a new one.")
else:
    print("Database exists. Proceeding with migration.")

try:
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    # Check if user table exists and what columns it has
    cursor.execute("PRAGMA table_info(user)")
    columns = cursor.fetchall()
    
    if not columns:
        # Table doesn't exist, create it with correct schema
        cursor.execute("""
            CREATE TABLE user (
                user_id INTEGER PRIMARY KEY AUTOINCREMENT,
                username VARCHAR(255) NOT NULL UNIQUE,
                password VARCHAR(255) NOT NULL,
                role VARCHAR(50) NOT NULL DEFAULT 'employee',
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )
        """)
        
        # Insert default users
        cursor.execute("""
            INSERT INTO user (username, password, role) 
            VALUES ('admin', 'admin123', 'admin')
        """)
        cursor.execute("""
            INSERT INTO user (username, password, role) 
            VALUES ('employee', 'emp123', 'employee')
        """)
        print("User table created with default users: admin/admin123 and employee/emp123")
    else:
        # Check if we need to add user_id column
        column_names = [column[1] for column in columns]
        if 'user_id' not in column_names:
            # Add user_id column if it doesn't exist
            cursor.execute("ALTER TABLE user ADD COLUMN user_id INTEGER")
            # Update existing rows with auto-increment values
            cursor.execute("UPDATE user SET user_id = rowid WHERE user_id IS NULL")
            print("Added user_id column to existing user table")

    conn.commit()
    cursor.close()
except sqlite3.Error as e:
    print("An error occurred while connecting to sqlite", e)
finally:
    if conn:
        conn.commit()
        cursor.close()
        conn.close()
