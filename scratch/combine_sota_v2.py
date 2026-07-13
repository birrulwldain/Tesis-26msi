import os
from PIL import Image, ImageOps, ImageDraw, ImageChops

def crop_white_margins(img):
    # Convert to RGB if it is RGBA or L
    if img.mode != 'RGB':
        img = img.convert('RGB')
    bg = Image.new(img.mode, img.size, (255, 255, 255))
    diff = ImageChops.difference(img, bg)
    bbox = diff.getbbox()
    if bbox:
        return img.crop(bbox)
    return img

def fit_and_pad(img, target_w, target_h):
    # Crop white margins first
    img_cropped = crop_white_margins(img)
    
    # Calculate scale factor to fit inside target dimensions
    img_w, img_h = img_cropped.size
    scale = min(target_w / img_w, target_h / img_h)
    new_w = int(img_w * scale)
    new_h = int(img_h * scale)
    
    # Resize
    img_resized = img_cropped.resize((new_w, new_h), Image.Resampling.LANCZOS)
    
    # Create white canvas and paste resized image in center
    canvas = Image.new('RGB', (target_w, target_h), 'white')
    x = (target_w - new_w) // 2
    y = (target_h - new_h) // 2
    canvas.paste(img_resized, (x, y))
    return canvas

# 1. Prepare Panel D (Combined Liu)
libs_img = crop_white_margins(Image.open('scratch/fig5_page6.png'))
p_img = crop_white_margins(Image.open('scratch/fig4_tl.png'))

# Resize both to the same height (say 400px)
h_target = 400
libs_w_new = int(libs_img.size[0] * (h_target / libs_img.size[1]))
libs_resized = libs_img.resize((libs_w_new, h_target), Image.Resampling.LANCZOS)

p_w_new = int(p_img.size[0] * (h_target / p_img.size[1]))
p_resized = p_img.resize((p_w_new, h_target), Image.Resampling.LANCZOS)

# Combine them side-by-side with a small black line separator (2px)
sep_w = 4
combined_liu_w = libs_w_new + p_w_new + sep_w
combined_liu = Image.new('RGB', (combined_liu_w, h_target), 'white')
combined_liu.paste(libs_resized, (0, 0))
combined_liu.paste(p_resized, (libs_w_new + sep_w, 0))

# Draw separator between them
draw_liu = ImageDraw.Draw(combined_liu)
draw_liu.line([(libs_w_new + sep_w//2, 0), (libs_w_new + sep_w//2, h_target)], fill='black', width=sep_w)
combined_liu.save('scratch/liu_combined_clean.png')

# 2. Prepare the 4 panels
target_w, target_h = 800, 600

# Panel A: MERLIN Favre
panel_a = fit_and_pad(Image.open('images/bab2/favre2025_fig16_spectra_expvsmerlin.png'), target_w, target_h)
# Panel B: CNN Favre
panel_b = fit_and_pad(Image.open('images/bab2/favre2025_fig12_cnn_prediction.png'), target_w, target_h)
# Panel C: Informer Walidain
panel_c = fit_and_pad(Image.open('images/bab2/walidain2026_fig2a_crop.png'), target_w, target_h)
# Panel D: Combined Liu
panel_d = fit_and_pad(combined_liu, target_w, target_h)

# 3. Create the final 2x2 grid image (1600x1200)
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
line_width = 8
# vertical line
draw.line([(target_w, 0), (target_w, grid_h)], fill='black', width=line_width)
# horizontal line
draw.line([(0, target_h), (grid_w, target_h)], fill='black', width=line_width)
# border around the whole grid
draw.rectangle([(0, 0), (grid_w - 1, grid_h - 1)], outline='black', width=line_width)

grid_img.save('images/bab2/sota_4panel_combined.png')
print("Successfully generated clean sota_4panel_combined.png!")
