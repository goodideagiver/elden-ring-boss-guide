import express, { Request, Response } from 'express'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()
const app = express()
const PORT = 3000

app.get('/', async (req: Request, res: Response) => {
  const users = await prisma.user.findMany()
  res.json(users)
})

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`)
})
