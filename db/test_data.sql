-- Add test data to the database
INSERT INTO `users`(
    `id`,
    `name`,
    `email`,
    `password`,
    `role`,
    `post_count`,
    `vote_count`
  )
VALUES (
    '11f0170d-02f4-464d-9ff0-edd1ce83c673',
    'thomasT3st',
    'thomas@test.com',
    '$2y$12$iWdpEbQZqwfBFtZjK3b6hOFU4U4rkZKyhIUNwu7m1zHlCq54BwMvy',
    'user',
    1,
    1
  ),
  (
    'f537be88-8951-4c2a-ad7e-d0b34b9c0633',
    'm4tt',
    'matt@test.com',
    '$2y$12$LDvatQ7s9i.sDD8TXGJzeet3ny47HTSXrmI.hnBhqAXCRMj2mSAy6',
    'moderator',
    0,
    0
  ),
  (
    '989a9302-e7d3-49b1-ba7a-f0fc9b04083c',
    'soph1',
    'sophia@test.com',
    '$2y$12$oZDI6qNYw4m0JK9rMAK2Du5ZfJDfynZSN1bK5GJrObGwa8yikuERm',
    'admin',
    0,
    0
  );

INSERT INTO `posts`(`id`, `users_id`, `title`, `text`, `vote_count`)
VALUES ('24f9d5bc-e25c-41b7-9cb9-e6c935c19556',
  '11f0170d-02f4-464d-9ff0-edd1ce83c673',
  'Test post',
  'This is a test post made by thomasT3st',
  1);

INSERT INTO `comments`(
    `id`,
    `posts_id`,
    `user_id`,
    `text`,
    `vote_count`
  )
VALUES ('129fe2d6-57e8-4169-8e0f-2b71c2b59c60',
  '24f9d5bc-e25c-41b7-9cb9-e6c935c19556',
  'f537be88-8951-4c2a-ad7e-d0b34b9c0633',
  'Test comment',
  1);
