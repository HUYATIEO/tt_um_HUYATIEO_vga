from PIL import Image
import os

def generate_verilog_rom(image_path, width=20, height=20):
    if not os.path.exists(image_path):
        print(f"Lỗi: Không tìm thấy file {image_path}")
        return

    # Mở ảnh, chuyển sang Grayscale (L) để triệt tiêu các kênh màu
    img = Image.open(image_path).convert('L')
    img = img.resize((width, height))
    pixels = img.load()
    
    # Ép chiều rộng lên 32 pixel (4 byte) để tối ưu hóa Multiplexer/Adder trên ASIC
    bytes_per_row = 4 
    total_bytes = height * bytes_per_row
    
    print(f"reg [7:0] mem[{total_bytes - 1}:0];")
    print("initial begin")
    
    byte_idx = 0
    for y in range(height):
        for byte_col in range(bytes_per_row):
            byte_val = 0
            for bit in range(8):
                x = byte_col * 8 + bit
                # Nạp pixel thật nếu x < 20, các pixel đệm mang giá trị 0
                if x < width:
                    # Lọc nhiễu JPEG: > 128 là pixel sáng (1), ngược lại là tối (0)
                    pixel_bit = 1 if pixels[x, y] > 128 else 0
                else:
                    pixel_bit = 0
                
                # Sắp xếp LSB ở x nhỏ nhất để khớp với biểu thức mem[addr][x&7]
                byte_val |= (pixel_bit << bit)
            
            print(f"    mem[{byte_idx}] = 8'h{byte_val:02x};")
            byte_idx += 1
            
    print("end")

if __name__ == "__main__":
    generate_verilog_rom("logo.jpg")
