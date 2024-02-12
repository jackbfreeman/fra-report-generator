import tkinter as tk

def on_submit():
    selected_document_type = document_type_var.get()
    selected_plaintiffs = plaintiffs_var.get()
    
    # You can add your logic or further actions based on the selected options here
    print("Selected Document Type:", selected_document_type)
    print("Number of Plaintiffs:", selected_plaintiffs)

# Create the main window
app = tk.Tk()
app.title("Document Generator")

# Set the window size with extra space on the sides
app.geometry("400x150")
app.minsize(400, 150)  # Set minimum width and height

# Dropdown menu for Document Type
document_type_label = tk.Label(app, text="Document type:")
document_type_label.grid(row=0, column=0, padx=10, pady=10)

document_types = ["Notes", "Causation report", "Rebuttal report", "Affidavit"]
document_type_var = tk.StringVar(app)
document_type_var.set(document_types[0])  # Set the default value

document_type_dropdown = tk.OptionMenu(app, document_type_var, *document_types)
document_type_dropdown.grid(row=0, column=1, padx=10, pady=10)

# Label for # of plaintiffs
plaintiffs_label = tk.Label(app, text="Number of Plaintiffs:")
plaintiffs_label.grid(row=0, column=2, padx=10, pady=10)

# Radio buttons for # of plaintiffs
plaintiffs_var = tk.IntVar(app)
plaintiffs_var.set(1)  # Set the default value

plaintiffs_radio_button1 = tk.Radiobutton(app, text="1", variable=plaintiffs_var, value=1)
plaintiffs_radio_button1.grid(row=0, column=3, padx=10, pady=10)

plaintiffs_radio_button2 = tk.Radiobutton(app, text="2", variable=plaintiffs_var, value=2)
plaintiffs_radio_button2.grid(row=0, column=4, padx=10, pady=10)

# Submit button at the bottom center
submit_button = tk.Button(app, text="Generate Document", command=on_submit)
submit_button.grid(row=1, column=2, pady=20, sticky="nsew")

# Adjust column weights to make the button centered
app.grid_columnconfigure(0, weight=1)
app.grid_columnconfigure(1, weight=1)
app.grid_columnconfigure(2, weight=1)
app.grid_columnconfigure(3, weight=1)
app.grid_columnconfigure(4, weight=1)

# Run the main loop
app.mainloop()
