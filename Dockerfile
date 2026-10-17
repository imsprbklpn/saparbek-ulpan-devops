FROM python:3.12-alpine

WORKDIR /app

COPY app/ /app/

RUN python -m py_compile app.py && echo "Image built for Ulpan Saparbek" > build_info.txt

ENV PYTHONUNBUFFERED=1 \
    STUDENT_NAME=Ulpan \
    STUDENT_SURNAME=Saparbek \
    STUDENT_GROUP=IT2-2310 \
    STUDENT_ID=37615

EXPOSE 5000

CMD ["python", "app.py"]
