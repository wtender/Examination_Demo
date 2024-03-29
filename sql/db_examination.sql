DROP DATABASE IF EXISTS db_examination;
CREATE DATABASE db_examination;

-- table admin
DROP TABLE IF EXISTS db_examination.admin;
CREATE TABLE db_examination.admin (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL  UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '管理员表';

-- table teacher
DROP TABLE IF EXISTS db_examination.teacher;
CREATE TABLE db_examination.teacher (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL  UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '教师表';

-- table assistant
DROP TABLE IF EXISTS db_examination.assistant;
CREATE TABLE db_examination.assistant (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL  UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '教务表';

INSERT INTO db_examination.admin
VALUES (NULL, 'admin@qq.com', 'admin', '13do3DeGj6b8Nxf0l3+J/ER05/yQzbHHPkaIhb4m01f+p0nj14OrJEIts4K2qZ3m');

-- table class
DROP TABLE IF EXISTS db_examination.class;
CREATE TABLE db_examination.class (
  id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  name       VARCHAR(255) NOT NULL
  COMMENT '班级名称',
  startDate  DATE         NOT NULL
  COMMENT '开班日期',
  finishDate DATE         NOT NULL
  COMMENT '结业日期'
)
  COMMENT '班级表';

-- table student
DROP TABLE IF EXISTS db_examination.student;
CREATE TABLE db_examination.student (
  id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email      VARCHAR(191) NOT NULL UNIQUE
  COMMENT '邮箱',
  username   VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password   VARCHAR(255) NOT NULL
  COMMENT '密码',
  gender     CHAR(1)      NOT NULL
  COMMENT '性别',
  dob        DATE         NOT NULL
  COMMENT '出生日期',
  tel        VARCHAR(255) COMMENT '电话',
  education  VARCHAR(255) COMMENT '学历',
  major      VARCHAR(255) COMMENT '专业',
  academy    VARCHAR(255) COMMENT '毕业院校',
  graduation DATE COMMENT '毕业日期',
  training   VARCHAR(255) COMMENT '培训经历',
  experience VARCHAR(255) COMMENT '工作经验',
  photo      VARCHAR(255) NOT NULL
  COMMENT '照片',
  remark     VARCHAR(255) COMMENT '备注',
  lastIp     VARCHAR(255) NOT NULL
  COMMENT '最后登录IP',
  lastLogin  DATETIME     NOT NULL
  COMMENT '最后登录时间',
  classId    INT UNSIGNED COMMENT 'FK 班级ID'
)
  COMMENT '学生表';


ALTER TABLE db_examination.student
  ADD CONSTRAINT
  fk_student_classId
FOREIGN KEY (classId)
REFERENCES db_examination.class (id);

SELECT *
FROM db_examination.admin;

SELECT *
FROM db_examination.teacher;

SELECT *
FROM db_examination.assistant;

SELECT *
FROM db_examination.student;

SELECT *
FROM db_examination.class;

SELECT
  s.username,
  c.name
FROM db_examination.student s INNER JOIN db_examination.class c ON s.classId = c.id;

SHOW TABLE STATUS FROM db_examination;

SHOW FULL COLUMNS FROM db_examination.student;