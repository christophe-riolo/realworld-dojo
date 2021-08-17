CREATE TABLE end_user (
  slug INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  username VARCHAR[50] UNIQUE NOT NULL,
  disabled BOOLEAN DEFAULT 'f',
  deleted BOOLEAN DEFAULT 'f'
);

CREATE TABLE article (
  slug INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR[100] NOT NULL,
  description VARCHAR[255],
  body TEXT,
  author INT REFERENCES end_user ON DELETE SET NULL
);

CREATE TABLE tag (
  tag VARCHAR[50] PRIMARY KEY
);

CREATE TABLE article_tag (
  article INT REFERENCES article ON DELETE CASCADE,
  tag VARCHAR[50] REFERENCES tag ON DELETE CASCADE,
  PRIMARY KEY (article, tag)
);

CREATE TABLE favorite (
  end_user INT REFERENCES end_user,
  article INT references article,
  PRIMARY KEY (end_user, article)
);
