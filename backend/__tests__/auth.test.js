const supertest = require('supertest')
const { describe, it, expect, afterEach } = require('@jest/globals')

const app = require('../app')
const { promisePool } = require('../db/pool')

describe('The signup endpoint', () => {
  afterEach(async () => {
    const deleteQuery = "DELETE FROM users WHERE email = 'thomas@test.com'"
    const { error } = await promisePool.query(deleteQuery)
    if (error) {
      console.log(error)
    }
  })

  it('should allow a user to create an account with valid information', async () => {
    const testUser = {
      username: 'test-user1',
      email: 'thomas@test.com',
      password: 'thomasTest1'
    }

    const response = await supertest(app)
      .post('/api/users/signup')
      .set('Content-Type', 'application/json')
      .set('Accept', 'application/json')
      .send(testUser)

    expect(response.status).toEqual(201)
    expect(response.headers['content-type']).toMatch(/json/)
    expect(response.body.id).toBeTruthy()
    expect(response.body.email).toEqual(testUser.email)
    expect(response.body.token).toBeTruthy()
  })

  it('should not allow a user to create an account without an username', async () => {
    const testUser = {
      username: '',
      email: 'thomas@test.com',
      password: 'thomasTest1'
    }

    const response = await supertest(app)
      .post('/api/users/signup')
      .set('Content-Type', 'application/json')
      .set('Accept', 'application/json')
      .send(testUser)

    expect(response.status).toEqual(400)
    expect(response.message).toEqual('"username" is not allowed to be empty')
  })

  it('should not allow a request with a missing username field', async () => {
    const testUser = {
      email: 'thomas@test.com',
      password: 'thomasTest1'
    }

    const response = await supertest(app)
      .post('/api/users/signup')
      .set('Content-Type', 'application/json')
      .set('Accept', 'application/json')
      .send(testUser)

    expect(response.status).toEqual(400)
    expect(response.message).toEqual('"username" is required')
  })

  it('should not allow a user to create an account without an email address', async () => {
    const testUser = {
      username: 'test-user1',
      email: '',
      password: 'thomasTest1'
    }

    const response = await supertest(app)
      .post('/api/users/signup')
      .set('Content-Type', 'application/json')
      .set('Accept', 'application/json')
      .send(testUser)

    expect(response.status).toEqual(400)
    expect(response.message).toEqual('"email" is not allowed to be empty')
  })

  it('should not allow a request with missing email field', async () => {
    const testUser = {
      username: 'test-user1',
      password: 'thomasTest1'
    }

    const response = await supertest(app)
      .post('/api/users/signup')
      .set('Content-Type', 'application/json')
      .set('Accept', 'application/json')
      .send(testUser)

    expect(response.status).toEqual(400)
    expect(response.message).toEqual('"email" is required')
  })

  it('should not allow a user to create an account without a password', async () => {
    const testUser = {
      username: 'test-user1',
      email: 'thomas@test.com',
      password: ''
    }

    const response = await supertest(app)
      .post('/api/users/signup')
      .set('Content-Type', 'application/json')
      .set('Accept', 'application/json')
      .send(testUser)

    expect(response.status).toEqual(400)
    expect(response.message).toEqual('"password" is not allowed to be empty')
  })

  it('should not allow a request with missing password field', async () => {
    const testUser = {
      username: 'test-user-1',
      email: 'thomas@test.com'
    }

    const response = await supertest(app)
      .post('/api/users/signup')
      .set('Content-Type', 'application/json')
      .set('Accept', 'application/json')
      .send(testUser)

    expect(response.status).toEqual(400)
    expect(response.message).toEqual('"password" is required')
  })

  it('should not allow two accounts with the same email to be created', async () => {
    const testUser1 = {
      username: 'Thomas Tester',
      email: 'tommy@test.com',
      password: 'thomasTester1'
    }

    const testUser2 = {
      username: 'Tom Tester',
      email: 'tommy@test.com',
      password: 'tomTester1'
    }

    const response1 = await supertest(app)
      .post('/api/users/signup')
      .set('Content-Type', 'application/json')
      .set('Accept', 'application/json')
      .send(testUser1)

    expect(response1.status).toEqual(201)
    expect(response1.body.id).toBeTruthy()
    expect(response1.body.email).toEqual(testUser1.email)
    expect(response1.body.token).toBeTruthy()

    const response2 = await supertest(app)
      .post('/api/users/signup')
      .set('Content-Type', 'application/json')
      .set('Accept', 'application/json')
      .send(testUser2)

    expect(response2.status).toEqual(400)
    expect(response2.message).toEqual('A user with this email already exists')
  })
})
