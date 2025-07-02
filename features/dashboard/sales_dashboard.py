import customtkinter as ctk
from tkinter import StringVar
import datetime
import calendar
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import sys
import os
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
from nav_bar import Navbar


class SalesDashboard(ctk.CTkFrame):
    def __init__(self, parent, main_app, user_role="admin"):
        super().__init__(parent)
        self.main_app = main_app
        self.user_role = user_role
        taskbar_height = 70
        screen_width = self.winfo_screenwidth()
        screen_height = self.winfo_screenheight()
        usable_height = screen_height - taskbar_height
        self.configure(fg_color="#f2efea")

        # Title Label
        self.title_label = ctk.CTkLabel(
            self, text="Dashboard", font=("Unbounded", 36, "bold"), text_color="#4e2d18"
        )
        self.title_label.pack(anchor="nw", padx=30, pady=(10, 0))

        # Filter Frame
        self.filter_frame = ctk.CTkFrame(self, fg_color="#f2efea")
        self.filter_frame.pack(anchor="nw", padx=30, pady=(20, 0))

        self.sales_type_var = StringVar(value="Sales Summary")
        self.sales_type_combo = ctk.CTkComboBox(
            self.filter_frame,
            values=["Sales Summary", "Sales by Category", "Sales by Product"],
            variable=self.sales_type_var,
            width=209, height=40, border_color="lightgray", border_width=2,
            corner_radius=8, fg_color="#f2efea", button_color="lightgray",
            button_hover_color="#6b3b1f",
            dropdown_fg_color="#f2efea", dropdown_hover_color="#f0f0f0",
            dropdown_text_color="#4e2d18",
            text_color="#4e2d18", font=("Inter", 13)
        )
        self.sales_type_combo.grid(row=0, column=0, padx=(20))

        self.periodicity_var = StringVar(value="Daily")
        self.periodicity_combo = ctk.CTkComboBox(
            self.filter_frame,
            values=["Daily", "Weekly", "Monthly", "Yearly"],
            variable=self.periodicity_var,
            width=209,height=40, border_color="lightgray", border_width=2,
            corner_radius=8, fg_color="#f2efea",
            button_color="lightgray", button_hover_color="#6b3b1f",
            dropdown_fg_color="#f2efea", dropdown_hover_color="#f0f0f0",
            dropdown_text_color="#4e2d18", text_color="#4e2d18",
            font=("Inter", 13),
            command=self.on_periodicity_change
        )
        self.periodicity_combo.grid(row=0, column=1, padx=(20))

        self.date_var = StringVar(value="Select Date")
        self.date_combo = ctk.CTkComboBox(
            self.filter_frame,
            values=[],
            variable=self.date_var,
            width=209, height=40, border_color="lightgray", border_width=2,
            corner_radius=8, fg_color="#f2efea", button_color="lightgray", button_hover_color="#6b3b1f",
            dropdown_fg_color="#f2efea", dropdown_hover_color="#f0f0f0", dropdown_text_color="#4e2d18",
            text_color="#4e2d18",
            font=("Inter", 13)
        )
        self.date_combo.grid(row=0, column=2, padx=(20))

        self.generate_button = ctk.CTkButton(
            self.filter_frame,
            text="Generate",
            width=129, height=40, fg_color="#4e2d18", hover_color="#3b1f11",
            text_color="#f2efea", font=("Inter", 13, "bold"), corner_radius=8,
            command=self.on_generate
        )
        self.generate_button.grid(row=0, column=3, padx=20)

        # Main Panel 
        self.dashboard_panel = ctk.CTkFrame(self, fg_color="#f2efea", corner_radius=20)
        self.dashboard_panel.pack(fill="both", expand=True, padx=0, pady=0)

        # --- Summary Cards  ---
        self.cards_frame = ctk.CTkFrame(self.dashboard_panel, fg_color="#fff")
        self.cards_frame.place(relx=0.5, rely=0.08, anchor="n", relwidth=0.85)

        self.card_data = [
            {"label": "Revenue", "value": "₱ 287.00", "change": "+₱287.00 (+100%)", "color": "#4e2d18", "change_color": "#7a9c33"},
            {"label": "Net Profit", "value": "₱ 200,00.00", "change": "+₱20,000.00", "color": "#4e2d18", "change_color": "#7a9c33"},
            {"label": "Expenses", "value": "₱ 145.00", "change": "-₱500.00", "color": "#4e2d18", "change_color": "#c30e0e"},
        ]
        self.card_labels = []
        for i, card in enumerate(self.card_data):
            self.cards_frame.grid_columnconfigure(i, weight=1)  # Make each column expand
            card_frame = ctk.CTkFrame(self.cards_frame, fg_color="#fff", corner_radius=16, height=80)
            card_frame.grid(row=0, column=i, padx=10, pady=5, sticky="nsew")
            value_label = ctk.CTkLabel(card_frame, text=card["value"], font=("Poppins", 20, "bold"), text_color=card["color"])
            value_label.pack(pady=(10, 0))
            label_label = ctk.CTkLabel(card_frame, text=card["label"], font=("Poppins", 12, "bold"), text_color=card["color"])
            label_label.pack()
            change_label = ctk.CTkLabel(card_frame, text=card["change"], font=("Poppins", 10), text_color=card["change_color"])
            change_label.pack()
            self.card_labels.append((value_label, change_label))

        # --- Chart  ---
        chart_frame = ctk.CTkFrame(self.dashboard_panel, fg_color="#fff")
        chart_frame.place(relx=0.5, rely=0.2, anchor="n", relwidth=0.85, relheight=0.75)

        self.fig = Figure(figsize=(7, 3), dpi=100)
        self.ax = self.fig.add_subplot(111)
        x_labels = ["Month, 01", "Month, 02", "Month, 03", "Month, 04", "Month, 05"]
        y_values = [0, 100, 0, 200, 50]
        self.ax.plot(x_labels, y_values, marker='o', color="#4e2d18")
        self.ax.set_title("Gross Sales")
        self.ax.set_ylabel("₱")
        self.ax.grid(True, linestyle='--', alpha=0.5)
        self.canvas = FigureCanvasTkAgg(self.fig, master=chart_frame)
        self.canvas.draw()
        self.canvas.get_tk_widget().pack(fill="both", expand=True)
 
        self.on_periodicity_change("Daily")

    def update_data(self):
        # Placeholder update function
        category = self.sales_type_var.get()
        periodicity = self.periodicity_var.get()
        date = self.date_var.get()

        print(f"Generating report for {category}, {periodicity}, {date}")
        # Update cards (example, you can update with real data)
        if category == "Sales by Category":
            row = ["Food", "12", "₱200.00", "₱50.00", "₱150.00"]
        elif category == "Sales by Product":
            row = ["Americano", "5", "₱100.00", "₱30.00", "₱70.00"]
        else:
            row = ["Summary", "17", "₱300.00", "₱80.00", "₱220.00"]
        self.card_labels[0][0].configure(text=row[2])  # Gross Sales value
        self.card_labels[1][0].configure(text="₱ 0.00")  # Refunds value
        self.card_labels[2][0].configure(text="₱ 145.00")  # Discounts value
        self.card_labels[3][0].configure(text=row[3])  # Net Sales value
        self.card_labels[4][0].configure(text=row[4])  # Gross Profits value
        
        self.fig.clf()
        poppins = {'fontname': 'Poppins', 'fontsize': 12}
        lighter_brown = '#bfa074'
        if category == "Sales by Product":
            self.ax = self.fig.add_subplot(111)
            labels = ["Americano", "Latte", "Mocha", "Cappuccino"]
            sizes = [30, 25, 25, 20]
            colors = ["#4e2d18", "#7a9c33", "#c30e0e", "#0091f7"]
            wedges, texts, autotexts = self.ax.pie(sizes, labels=labels, colors=colors, autopct='%1.1f%%', startangle=140, textprops={'fontname': 'Poppins', 'fontsize': 12})  # type: ignore
            self.ax.set_title("Sales by Product", fontname='Poppins', fontsize=14, fontweight='bold')
        else:
            self.ax = self.fig.add_subplot(111)
            if category == "Sales Summary":
                x_labels = ["Month, 01", "Month, 02", "Month, 03", "Month, 04", "Month, 05"]
                y_values = [0, 100, 0, 200, 50]
                self.ax.plot(x_labels, y_values, marker='o', color=lighter_brown)
                self.ax.set_title("Gross Sales", fontname='Poppins', fontsize=14, fontweight='bold')
                self.ax.set_ylabel("₱", fontname='Poppins', fontsize=12)
                self.ax.set_xlabel("", fontname='Poppins', fontsize=12)
                self.ax.grid(True, linestyle='--', alpha=0.5)
            elif category == "Sales by Category":
                labels = ["Coffee", "Non-Coffee", "Food"]
                values = [120, 80, 60]
                self.ax.bar(labels, values, color=lighter_brown)
                self.ax.set_title("Sales by Category", fontname='Poppins', fontsize=14, fontweight='bold')
                self.ax.set_ylabel("Items Sold", fontname='Poppins', fontsize=12)
                self.ax.grid(axis='y', linestyle='--', alpha=0.5)
        
        for label in self.ax.get_xticklabels() + self.ax.get_yticklabels():
            label.set_fontname('Poppins')
            label.set_fontsize(12)
        self.canvas.draw()

    def on_periodicity_change(self, value):
        periodicity = self.periodicity_var.get()
        today = datetime.date.today()
        options = []
        if periodicity == "Daily":
            year = today.year
            month = today.month
            num_days = calendar.monthrange(year, month)[1]
            options = [today.replace(day=day).strftime("%B %d, %Y") for day in range(1, num_days+1)]
        elif periodicity == "Weekly":
            year = today.year
            month = today.month
            first_day = today.replace(day=1)
            last_day = today.replace(day=calendar.monthrange(year, month)[1])
            weeks = []
            current = first_day
            while current <= last_day:
                week_num = ((current.day - 1) // 7) + 1
                week_label = f"Week {week_num} ({current.strftime('%b %d')})"
                if week_label not in weeks:
                    weeks.append(week_label)
                current += datetime.timedelta(days=7 - current.weekday())
            options = weeks
        elif periodicity == "Monthly":
            year = today.year
            options = [datetime.date(year, m, 1).strftime("%B %Y") for m in range(1, 13)]
        elif periodicity == "Yearly":
            current_year = today.year
            options = [str(y) for y in range(2020, current_year+1)]
        else:
            options = ["Select Date"]
        self.date_combo.configure(values=options)
        if options:
            self.date_var.set(options[0])
        else:
            self.date_var.set("Select Date")
        #self.update_data()

    def on_generate(self):
        self.update_data()
        print("Generate button clicked")
        print(f"Sales Type: {self.sales_type_var.get()}")
        print(f"Periodicity: {self.periodicity_var.get()}")
        print(f"Date: {self.date_var.get()}")

    def show_ticket(self):
        self.main_app.show_frame("ticket")

    def show_receipt(self):
        self.main_app.show_frame("receipt")

    def show_inventory(self):
        self.main_app.show_frame("inventory")

    def show_staff(self):
        self.main_app.show_frame("staff")

    def show_cashbox(self):
        self.main_app.show_frame("cashbox")

    def show_dashboard(self):
        self.main_app.show_frame("dashboard")


if __name__ == "__main__":
    import tkinter as tk
    root = tk.Tk()
    # Replace 'main_app' with 'root' as parent, and pass 'root' as main_app if needed
    app = SalesDashboard(parent=root, main_app=root)
    app.pack(fill="both", expand=True)
    root.mainloop()