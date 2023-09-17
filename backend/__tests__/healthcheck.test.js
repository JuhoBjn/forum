const supertest = require('supertest')
const { describe, it, expect } = require('@jest/globals')

const app = require('../app')

describe('Healthcheck endpoint', () => {
  it('should respond with status 200 if the backend is running', async () => {
    const response = await supertest(app).get('/healthcheck')
    expect(response.status).toEqual(200)
  })
})
