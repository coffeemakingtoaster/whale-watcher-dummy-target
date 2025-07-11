const express = require("express")
const app = express()
const port = 3000

app.get("/health", (_, res) => {
	console.log("Health endpoint called")
	res.statusCode = 200
	res.send("ok")
})

app.listen(port, () => {
	console.log(`Starting on port ${port}`)
})
