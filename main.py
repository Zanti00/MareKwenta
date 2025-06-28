import customtkinter as ctk
from pages.ticket_main import TicketMain

ctk.set_appearance_mode("Light")  # or "Dark"
ctk.set_default_color_theme("blue")

app = ctk.CTk()
app.geometry("1280x720")
app.title("MareKwenta POS")

main_page = TicketMain(master=app)
main_page.pack(fill="both", expand=True)

app.mainloop()
