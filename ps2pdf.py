import os
import subprocess

def convert_single_ps_to_pdf(ps_file):
    # 檢查輸入檔案是否為 .ps 檔案
    if not ps_file.endswith(".ps"):
        print("The file is not a .ps file.")
        return
    
    # 生成對應的 .pdf 檔名
    pdf_file = os.path.splitext(ps_file)[0] + ".pdf"
    
    # 使用 ghostscript 進行轉換
    try:
        # 呼叫 `ps2pdf` 命令進行轉檔
        subprocess.run(["ps2pdf", ps_file, pdf_file], check=True)
        print(f"Successfully converted {ps_file} to {pdf_file}")
    except subprocess.CalledProcessError as e:
        print(f"Failed to convert {ps_file}: {e}")

# 設定要轉換的單一 .ps 檔案路徑
ps_file_path = './waveform_plot.ps'
convert_single_ps_to_pdf(ps_file_path)
