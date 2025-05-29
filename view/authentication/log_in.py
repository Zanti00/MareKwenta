import ttkbootstrap as tb
from ttkbootstrap.constants import *

def open_login(login_window, inner_frame):
    # CREATE A FULLSCREEN WINDOW


# MAREKWENTA LABEL
    label = tb.Label(
        inner_frame,
        text="MareKwenta",
        font=("Unbounded", 30, "bold"),
        foreground="#4D2D18",
        background="#CABA9C"
    )   
    label.grid(row=0, column=0, padx=20, pady=20)

    style = tb.Style()
    style.configure("Custom.TSeparator", background="#4D2D18")

    # Separator using the custom style
    sep = tb.Separator(inner_frame, orient=HORIZONTAL, style="Custom.TSeparator")
    sep.grid(row=1, column=0, sticky="ew", padx=40, pady=5)

    # POS LABEL
    pos_label = tb.Label(
        inner_frame,
        text="POS",
        font=("Unica One", 20),
        foreground="#4D2D18",
        background="#CABA9C"
    )
    pos_label.grid(row=2, column=0, pady=(10, 20))

    style = tb.Style()
    style.configure("Login.TFrame", background="#F2EFEA")

    # LOGIN FRAME
    login_frame = tb.Frame(
    inner_frame,
    style="Login.TFrame",
    padding=(60, 20, 60, 20),
    borderwidth=1,
    relief="solid"       
)

    login_frame.grid(row=3, column=0, pady=(10, 20))
    login_frame.grid_rowconfigure(0, weight=1)
    login_frame.grid_rowconfigure(1, weight=1)
    login_frame.grid_columnconfigure(0, weight=1)


 # Username Label
    username_label = tb.Label(
        login_frame,
        text="Username",
        font=("Montserrat Medium", 11),
        foreground="#4D2D18",
        background="#F2EFEA"
    )
    username_label.grid(row=0, column=0, sticky="w", padx=40, pady=(0, 2))

# Username Entry
    username = tb.Entry(login_frame, font=("Montserrat Medium", 11))
    username.grid(row=1, column=0, sticky="we", padx=40, pady=(0, 10))

# Password Label
    password_label = tb.Label(  
        login_frame,
        text="Password",
        font=("Montserrat Medium", 11),
        foreground="#4D2D18",
        background="#F2EFEA"
    )
    password_label.grid(row=2, column=0, sticky="w", padx=40, pady=(0, 2))

# Password Entry
    password = tb.Entry(login_frame, show="*", font=("Montserrat Medium", 11))
    password.grid(row=3, column=0, sticky="we", padx=40, pady=(0, 10))

# Make column expand horizontally
    login_frame.columnconfigure(0, weight=1)

    style = tb.Style()

    style.configure(
        "primary.TButton",
        foreground="white",
        background="#5E3921",  # default background (can be lighter/different)
        font=("Montserrat Medium", 11)
    )

    style.map(
        "primary.TButton",
        background=[
            ("active", "#4D2D18"),   # when hovered/active
            ("pressed", "#3B1F0F"),  # when clicked/pressed (darker shade)
            ("!active", "#5E3921")   # normal state (optional)
        ],
        foreground=[
            ("disabled", "gray"),
            ("!disabled", "white")
        ]   
    )

    login_btn = tb.Button(
        login_frame,
        text="Log In",
        width=12,
        style="primary.TButton",
        command=lambda: print("Login clicked")
    )
    login_btn.grid(row=4, column=0, pady=(10, 0))


    login_window.mainloop()
