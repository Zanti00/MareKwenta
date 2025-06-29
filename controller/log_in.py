import sqlite3

def log_in(username, password):
    try:
        username = username.get()
        password = password.get()
        conn = sqlite3.connect('mare_kwenta.db')

        query = "SELECT * FROM users WHERE username = ? AND password = ?"

        cursor = conn.execute(query, (username, password))

        users = cursor.fetchall()

        if len(users) > 0:
            print("Login successful")
            # Proceed with the application logic
        else:
            print("Login failed: Invalid username or password")
            return False
            # Handle login failure (e.g., show an error message)
    except sqlite3.Error as e:
        print(f"Database error: {e}")
    finally:
        if conn:
            conn.close()
            print("Database connection closed")