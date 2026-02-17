import gradio as gr
from huggingface_hub import HfFolder

def greet(name, intensity):
    return f"Helloooo {name} !\n" * intensity

demo_greeting = gr.Interface(
    fn=greet,
    inputs=[
        gr.Textbox(label="Name"),
        gr.Slider(label="Intensity", minimum=1, maximum=10, step=1)
    ],
    outputs=gr.Textbox(label="Greeting")
)

# demo.launch(
#     server_name="0.0.0.0", 
#     server_port=7860,
#     share=False
# )

# Demo Sum
def add_numbers(a, b):
    return a + b

demo_sum = gr.Interface(
    fn=add_numbers,
    inputs=[
        gr.Number(label="Number 1"),
        gr.Number(label="Number 2")
    ],
    outputs=gr.Number(label="Sum")
)

demo_sum.launch(
    server_name="0.0.0.0", 
    server_port=7860,
    share=False
)



# Gradio has a large number of input types. The more commonly encountered ones are listed below:

# Checkbox: A checkbox that can be set to True or False.
# CheckboxGroup: An input type that allows users to select multiple values from a predefined checkbox list.
# Dropdown: An input type that provides a dropdown list where, by default, one value can be selected. If multiselect is set to True, then one or more values can be selected.
# File: An input type that allows a user to upload a file.
# Image: An input type that allows the user to select or upload an image.
# Radio: An input type that forces the user to choose one value.
# Slider: An input type that provides a slider where a value must be selected between a minimum and a maximum range. The value parameter defines the default value, and step provides the increment value. Setting the minimum, maximum, and step values to integers will select integer values.
# Textbox: An expandible text box that allows the user to type in text.