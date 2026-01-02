# استخدام نسخة Python رسمية
FROM python:3.10-slim

# تعيين مجلد العمل
WORKDIR /app

# نسخ ملف المتطلبات وتثبيتها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ ملفات التطبيق
COPY . .

# فتح البورت 8080
EXPOSE 8080

# تشغيل التطبيق باستخدام Gunicorn ليعمل كخادم إنتاجي قوي
# -w 2 عدد العمال (Workers)
# -b 0.0.0.0:8080 الرابط والبورت
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8080", "app:app"]
