FROM redis:alpine
WORKDIR /app
COPY ./app .
RUN pip install -r requirements.txt
# RUN pipenv install
# RUN pipenv run python3 main.py

ENTRYPOINT ["python3", "main.py"]
