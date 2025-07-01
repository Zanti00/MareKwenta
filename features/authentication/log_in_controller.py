import sqlite3

def authenticate_user(username_entry, password_entry):
    try:
        username = username_entry.get().strip()
        password = password_entry.get().strip()
        conn = sqlite3.connect('mare_kwenta.db')

        if not username or not password:
            print("Please enter both username and password")
            return None
        
        conn = sqlite3.connect('mare_kwenta.db')

        query = "SELECT user_role FROM user WHERE username = ? AND password = ?"

        cursor = conn.execute(query, (username, password))

        user_data = cursor.fetchone()

        if user_data:
            print("Login successful")
            return True, user_data[0]
        else:
            return False, None
    except sqlite3.Error as e:
        print(f"Database error: {e}")
        return None
    except Exception as e:
        print(f"Error during authentication: {e}")
        return None
    finally:
        if conn:
            conn.close()
            print("Database connection closed")