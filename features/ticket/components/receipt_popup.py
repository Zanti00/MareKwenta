import customtkinter as ctk
from datetime import datetime

class ReceiptPopup(ctk.CTkToplevel):
    def __init__(self, master, ticket_details):
        super().__init__(master)
        self.title("Receipt")
        self.geometry("400x600")
        self.configure(fg_color="#ffffff")
        self.resizable(False, False)
        
        self.ticket_details = ticket_details
        
        # Make modal
        self.grab_set()
        self.focus_set()
        self.transient(master)
        
        self.create_receipt()

    def create_receipt(self):
        # Main container
        main_frame = ctk.CTkFrame(self, fg_color="#ffffff")
        main_frame.pack(fill="both", expand=True, padx=20, pady=20)
        
        # Header
        header_label = ctk.CTkLabel(
            main_frame,
            text="MareKwenta POS",
            font=ctk.CTkFont("Unbounded", 24, "bold"),
            text_color="#4e2d18"
        )
        header_label.pack(pady=(0, 10))
        
        # Ticket info
        ticket_info_frame = ctk.CTkFrame(main_frame, fg_color="transparent")
        ticket_info_frame.pack(fill="x", pady=(0, 10))
        
        info_text = f"""Ticket #: {self.ticket_details['ticket_id']}
Date: {self.ticket_details['ticket_date']}
Cashier: {self.ticket_details['employee_name']}"""
        
        info_label = ctk.CTkLabel(
            ticket_info_frame,
            text=info_text,
            font=ctk.CTkFont("Inter", 12),
            text_color="#666666",
            justify="left"
        )
        info_label.pack(anchor="w")
        
        # Separator
        separator = ctk.CTkFrame(main_frame, height=2, fg_color="#cccccc")
        separator.pack(fill="x", pady=10)
        
        # Items list
        items_frame = ctk.CTkScrollableFrame(main_frame, height=250, fg_color="#f8f8f8")
        items_frame.pack(fill="both", expand=True, pady=(0, 10))
        
        for line in self.ticket_details['lines']:
            item_frame = ctk.CTkFrame(items_frame, fg_color="transparent")
            item_frame.pack(fill="x", pady=2)
            
            # Product name with size/temperature if available
            product_info = line['product_name']
            if line['size'] and line['temperature']:
                product_info += f" ({line['size']}, {line['temperature']})"
            
            product_label = ctk.CTkLabel(
                item_frame,
                text=product_info,
                font=ctk.CTkFont("Inter", 12, "bold"),
                text_color="#4e2d18",
                anchor="w"
            )
            product_label.pack(anchor="w")
            
            # Quantity and price
            price_info = f"{line['quantity']} x ₱{line['unit_price']:.2f} = ₱{line['quantity'] * line['unit_price']:.2f}"
            price_label = ctk.CTkLabel(
                item_frame,
                text=price_info,
                font=ctk.CTkFont("Inter", 11),
                text_color="#666666",
                anchor="w"
            )
            price_label.pack(anchor="w")
        
        # Totals
        totals_frame = ctk.CTkFrame(main_frame, fg_color="transparent")
        totals_frame.pack(fill="x", pady=10)
        
        # Subtotal
        subtotal_frame = ctk.CTkFrame(totals_frame, fg_color="transparent")
        subtotal_frame.pack(fill="x")
        
        ctk.CTkLabel(
            subtotal_frame,
            text="Subtotal:",
            font=ctk.CTkFont("Inter", 12),
            text_color="#4e2d18"
        ).pack(side="left")
        
        ctk.CTkLabel(
            subtotal_frame,
            text=f"₱{self.ticket_details['line_price']:.2f}",
            font=ctk.CTkFont("Inter", 12),
            text_color="#4e2d18"
        ).pack(side="right")
        
        # Discount (if any)
        if self.ticket_details['discount'] > 0:
            discount_frame = ctk.CTkFrame(totals_frame, fg_color="transparent")
            discount_frame.pack(fill="x")
            
            ctk.CTkLabel(
                discount_frame,
                text="Discount:",
                font=ctk.CTkFont("Inter", 12),
                text_color="#4e2d18"
            ).pack(side="left")
            
            ctk.CTkLabel(
                discount_frame,
                text=f"-₱{self.ticket_details['discount']:.2f}",
                font=ctk.CTkFont("Inter", 12),
                text_color="#e74c3c"
            ).pack(side="right")
        
        # Total
        total_frame = ctk.CTkFrame(totals_frame, fg_color="transparent")
        total_frame.pack(fill="x", pady=(5, 0))
        
        ctk.CTkLabel(
            total_frame,
            text="Total:",
            font=ctk.CTkFont("Inter", 14, "bold"),
            text_color="#4e2d18"
        ).pack(side="left")
        
        ctk.CTkLabel(
            total_frame,
            text=f"₱{self.ticket_details['total_amount']:.2f}",
            font=ctk.CTkFont("Inter", 14, "bold"),
            text_color="#4e2d18"
        ).pack(side="right")
        
        # Payment info
        payment_frame = ctk.CTkFrame(totals_frame, fg_color="transparent")
        payment_frame.pack(fill="x", pady=(10, 0))
        
        for payment in self.ticket_details['payments']:
            pay_info_frame = ctk.CTkFrame(payment_frame, fg_color="transparent")
            pay_info_frame.pack(fill="x")
            
            ctk.CTkLabel(
                pay_info_frame,
                text=f"{payment['payment_type']}:",
                font=ctk.CTkFont("Inter", 12),
                text_color="#4e2d18"
            ).pack(side="left")
            
            ctk.CTkLabel(
                pay_info_frame,
                text=f"₱{payment['payment_amount']:.2f}",
                font=ctk.CTkFont("Inter", 12),
                text_color="#4e2d18"
            ).pack(side="right")
        
        # Change
        change_frame = ctk.CTkFrame(totals_frame, fg_color="transparent")
        change_frame.pack(fill="x")
        
        ctk.CTkLabel(
            change_frame,
            text="Change:",
            font=ctk.CTkFont("Inter", 12),
            text_color="#4e2d18"
        ).pack(side="left")
        
        ctk.CTkLabel(
            change_frame,
            text=f"₱{self.ticket_details['change']:.2f}",
            font=ctk.CTkFont("Inter", 12),
            text_color="#27ae60"
        ).pack(side="right")
        
        # Footer - Fixed the italic font issue
        footer_label = ctk.CTkLabel(
            main_frame,
            text="Thank you for your purchase!",
            font=ctk.CTkFont("Inter", 12),  # Removed "italic" parameter
            text_color="#666666"
        )
        footer_label.pack(pady=(10, 0))
        
        # Close button
        close_btn = ctk.CTkButton(
            main_frame,
            text="Close",
            width=100,
            height=35,
            font=ctk.CTkFont("Inter", 12, "bold"),
            fg_color="#4e2d18",
            text_color="#ffffff",
            corner_radius=8,
            command=self.destroy
        )
        close_btn.pack(pady=(15, 0))
