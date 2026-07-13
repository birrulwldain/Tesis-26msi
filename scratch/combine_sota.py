import os
from PIL import Image, ImageOps, ImageDraw

def fit_and_pad(img_path, target_w, target_h):
    img = Image.open(img_path)
    # Convert to RGB if it is RGBA or L
    if img.mode != 'RGB':
        img = img.convert('RGB')
    
    # Calculate scale factor to fit inside target dimensions
    img_w, img_h = img.size
    scale = min(target_w / img_w, target_h / img_h)
    new_w = int(img_w * scale)
    new_h = int(img_h * scale)
    
    # Resize
    img_resized = img.resize((new_w, new_h), Image.Resampling.LANCZOS)
    
    # Create white canvas and paste resized image in center
    canvas = Image.new('RGB', (target_w, target_h), 'white')
    x = (target_w - new_w) // 2
    y = (target_h - new_h) // 2
    canvas.paste(img_resized, (x, y))
    return canvas

# 1. Combine Liu's two images side-by-side first to create Panel D
# We want the combined panel D to fit inside 800x600
# Let's resize the LIBS spectrum and the scatter plot to the same height (say 400px)
h_target = 400
libs_img = Image.open('scratch/fig5_page6.png')
libs_w, libs_h = libs_img.size
libs_w_new = int(libs_w * (h_target / libs_h))
libs_resized = libs_img.resize((libs_w_new, h_target), Image.Resampling.LANCZOS)

p_img = Image.open('scratch/fig4_tl.png')
p_w, p_h = p_img.size
p_w_new = int(p_w * (h_target / p_h))
p_resized = p_img.resize((p_w_new, h_target), Image.Resampling.LANCZOS)

# Create a combined image side-by-side
combined_liu_w = libs_w_new + p_w_new
combined_liu = Image.new('RGB', (combined_liu_w, h_target), 'white')
combined_liu.paste(libs_resized, (0, 0))
combined_liu.paste(p_resized, (libs_w_new, 0))
combined_liu.save('scratch/liu_combined_raw.png')

# Now prepare the 4 panels
target_w, target_h = 800, 600

# Panel A: MERLIN Favre
panel_a = fit_and_pad('images/bab2/favre2025_fig16_spectra_expvsmerlin.png', target_w, target_h)
# Panel B: CNN Favre
panel_b = fit_and_pad('images/bab2/favre2025_fig12_cnn_prediction.png', target_w, target_h)
# Panel C: Informer Walidain
panel_c = fit_and_pad('images/bab2/walidain2026_fig2a_crop.png', target_w, target_h)
# Panel D: Combined Liu
panel_d = fit_and_pad('scratch/liu_combined_raw.png', target_w, target_h)

# Create the final 2x2 grid image (1600x1200)
grid_w = target_w * 2
grid_h = target_h * 2
grid_img = Image.new('RGB', (grid_w, grid_h), 'white')

# Paste the 4 panels
grid_img.paste(panel_a, (0, 0))
grid_img.paste(panel_b, (target_w, 0))
grid_img.paste(panel_c, (0, target_h))
grid_img.paste(panel_d, (target_w, target_h))

# Draw the black separator lines (horizontal and vertical)
draw = ImageDraw.Draw(grid_img)
line_width = 4
# vertical line
draw.line([(target_w, 0), (target_w, grid_h)], fill='black', width=line_width)
# horizontal line
draw.line([(0, target_h), (grid_w, target_h)], fill='black', width=line_width)
# border
draw.rectangle([(0, 0), (grid_w - 1, grid_h - 1)], outline='black', width=line_width)

grid_img.save('images/bab2/sota_4panel_combined.png')
print("Successfully generated sota_4panel_combined.png!")
