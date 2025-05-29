import ttkbootstrap as tb
from ttkbootstrap.constants import *
from log_in import open_login

def close_window():
    open_login(splash_window, inner_frame)  # Open the login window after closing the splash screen

# CREATE A FULLSCREEN WINDOW
splash_window = tb.Window(themename="flatly")
splash_window.title("MareKwenta POS")
width = splash_window.winfo_screenwidth()
height = splash_window.winfo_screenheight()
splash_window.attributes('-fullscreen', True)

style = tb.Style()
style.configure("Custom.TFrame", background="#CABA9C")

# OUTER FRAME (fills the whole window)
outer_frame = tb.Frame(splash_window, style="Custom.TFrame")
outer_frame.pack(fill="both", expand=True)
outer_frame.grid_rowconfigure(0, weight=1)
outer_frame.grid_columnconfigure(0, weight=1)

# INNER FRAME (centered in the outer frame)
inner_frame = tb.Frame(outer_frame, style="Custom.TFrame")
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

# SHOW THE SPLASH SCREEN FOR 3 SECONDS
splash_window.after(3000, close_window)
splash_window.mainloop()
