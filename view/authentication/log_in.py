import ttkbootstrap as tb
from ttkbootstrap.constants import *

def open_login():
    # CREATE A FULLSCREEN WINDOW
    login_window = tb.Window(themename="darkly")
    login_window.title("MareKwenta POS")
    width = login_window.winfo_screenwidth()
    height = login_window.winfo_screenheight()
    login_window.attributes('-fullscreen', True)

    style = tb.Style()
    style.configure("Login.TFrame", background="#CABA9C")
    # OUTER FRAME (fills the whole window)
    outer_frame = tb.Frame(login_window, style="Login.TFrame")
    outer_frame.pack(fill="both", expand=True)
    outer_frame.grid_rowconfigure(0, weight=1)
    outer_frame.grid_columnconfigure(0, weight=1)

    # INNER FRAME (centered in the outer frame)
    inner_frame = tb.Frame(outer_frame)
    inner_frame.grid(row=0, column=0)


    # MAREKWENTA LABEL
    label = tb.Label(
        inner_frame,
        text="MareKwenta",
        font=("Unbounded", 30, "bold"),
        foreground="#4D2D18",
        background="#CABA9C"
    )
    label.grid(row=0, column=0, padx=20, pady=20)

    # SEPARATOR
    sep = tb.Separator(inner_frame, orient=HORIZONTAL)
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

    # LOGIN FRAME
    login_frame = tb.Frame(inner_frame, style="Login.TFrame")
    login_frame.grid(row=3, column=0, pady=(10, 20))

    # Login Contents
    title = tb.Label(
        login_frame,
        text="Log In",
        font=("Segoe UI", 16, "bold"),
        foreground="#4D2D18",
        background="white"
    )
    title.pack(pady=(15, 5))

    username = tb.Entry(login_frame, font=("Segoe UI", 11))
    username.pack(pady=(10, 10), padx=40, fill="x")

    password = tb.Entry(login_frame, show="*", font=("Segoe UI", 11))
    password.pack(pady=(0, 15), padx=40, fill="x")

    login_btn = tb.Button(
        login_frame,
        text="Log In",
        bootstyle="primary",
        command=lambda: print("Login clicked")
    )
    login_btn.pack()

    login_window.mainloop()
