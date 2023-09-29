import express from 'express';

const app = express();
const port = 8081;

app.get('/rest/api/v1/ping', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`Listening on port ${port}...`);
});
