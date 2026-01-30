from PIL import Image
import os

source_image_path = r"C:/Users/PCUSER/.gemini/antigravity/brain/22c81017-83b7-403a-83ce-50ab9c4bd911/uploaded_image_1768243705353.png"
output_dir = r"c:/Users/PCUSER/.gemini/antigravity/scratch/children_nisa_sim"

try:
    img = Image.open(source_image_path)
    
    # Generate favicon.ico (32x32)
    # ICO format can store multiple sizes, but user asked for 32x32. 
    # Calling it .ico but saving as ICO format requires format='ICO'.
    # PIL can save as ICO.
    favicon = img.resize((32, 32), Image.Resampling.LANCZOS)
    favicon.save(os.path.join(output_dir, "favicon.ico"), format='ICO')
    print("Created favicon.ico")

    # Generate apple-touch-icon.png (180x180)
    apple_icon = img.resize((180, 180), Image.Resampling.LANCZOS)
    apple_icon.save(os.path.join(output_dir, "apple-touch-icon.png"), format='PNG')
    print("Created apple-touch-icon.png")

except Exception as e:
    print(f"Error processing image: {e}")
