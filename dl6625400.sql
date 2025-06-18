-- Tạo database mới
CREATE DATABASE QBCA_DB;
GO

DROP TABLE IF EXISTS Notification;
DROP TABLE IF EXISTS Exam;
DROP TABLE IF EXISTS Task;
DROP TABLE IF EXISTS Question;
DROP TABLE IF EXISTS Subject;
DROP TABLE IF EXISTS Users;

GO



-- Sử dụng database vừa tạo
USE QBCA_DB;
GO

-- Tạo bảng Users
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Role NVARCHAR(50) NOT NULL,
    Subject NVARCHAR(50) NULL
);
GO

-- Tạo bảng Subject
CREATE TABLE Subject (
    SubjectID NVARCHAR(20) PRIMARY KEY,
    SubjectName NVARCHAR(100) NOT NULL,
    CLOs NVARCHAR(MAX),
    DifficultyLevel NVARCHAR(50)
);
GO

-- Tạo bảng Question
CREATE TABLE Question (
    QuestionID INT IDENTITY(1,1) PRIMARY KEY,
    SubjectID NVARCHAR(20) NOT NULL,
    QuestionText NVARCHAR(MAX) NOT NULL,
    DifficultyLevel NVARCHAR(50),
    IsDuplicate BIT DEFAULT 0,
    CreatedBy INT,
    CreatedDate DATETIME,
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID),
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID)
);
GO

-- Tạo bảng Task
CREATE TABLE Task (
    TaskID INT IDENTITY(1,1) PRIMARY KEY,
    AssignedTo INT,
    SubjectID NVARCHAR(20),
    TaskDescription NVARCHAR(MAX),
    Status NVARCHAR(50),
    DueDate DATETIME,
    FOREIGN KEY (AssignedTo) REFERENCES Users(UserID),
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);
GO

-- Tạo bảng Exam
CREATE TABLE Exam (
    ExamID INT IDENTITY(1,1) PRIMARY KEY,
    SubjectID NVARCHAR(20),
    ExamDate DATETIME,
    TotalQuestions INT,
    DifficultyPercentage NVARCHAR(100),
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);
GO

-- Tạo bảng Notification
CREATE TABLE Notification (
    NotificationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    Message NVARCHAR(MAX),
    IsRead BIT DEFAULT 0,
    CreatedDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO



INSERT INTO Users (Username, Password, Role, Subject) VALUES
('nguyenanhthu01', 'Pass1234!', 'Lecturer', 'ENG101'),
('tranminhhoa02', 'HoaTran2025', 'Head of Department', 'ENG102'),
('lehoangnam03', 'HoangNam@456', 'R&D Staff', 'ENG103'),
('phamthikim04', 'KimPham#789', 'Exam Manager', 'ENG104'),
('vuhoanganh05', 'AnhVu2025$', 'Lecturer', 'ENG105'),
('ngothithu06', 'ThuNgo!2025', 'Lecturer', 'ENG106'),
('tranvanlong07', 'LongTran_123', 'R&D Staff', 'ENG107'),
('phamminhduc08', 'MinhDuc$321', 'Head of Department', 'ENG108'),
('lethithuy09', 'ThuyLe#456', 'Lecturer', 'ENG109'),
('nguyenquanghuy10', 'HuyNguyen@789', 'Exam Manager', 'ENG110'),
('nguyenvana11', 'VanA1234$', 'Lecturer', 'ENG111'),
('tranvannb12', 'VanNB@2025', 'Head of Department', 'ENG112'),
('lequocbao13', 'QuocBao#456', 'R&D Staff', 'ENG113'),
('phamhongc14', 'HongC789!', 'Lecturer', 'ENG114'),
('vutrongd15', 'TrongD$2025', 'Lecturer', 'ENG115'),
('nguyenthanh16', 'ThanhNgo!321', 'R&D Staff', 'ENG116'),
('tranminhe17', 'MinhE_456', 'Head of Department', 'ENG117'),
('phamphucf18', 'PhucF$789', 'Lecturer', 'ENG118'),
('lethithug19', 'ThuG#123', 'Exam Manager', 'ENG119'),
('nguyenvanhh20', 'VanHH@456', 'Lecturer', 'ENG120'),
('tranvannk21', 'VanNK!789', 'Lecturer', 'ENG121'),
('lequoch22', 'QuocH$2025', 'Head of Department', 'ENG122'),
('phamminhdk23', 'MinhDK_321', 'Lecturer', 'ENG123'),
('vutranlh24', 'TranLH#456', 'Exam Manager', 'ENG124'),
('nguyenvanto25', 'VanTo!789', 'Lecturer', 'ENG125'),
('tranthikp26', 'ThiKP$2025', 'Lecturer', 'ENG126'),
('lehoangtq27', 'HoangTQ_123', 'R&D Staff', 'ENG127'),
('phamdangr28', 'DangR#456', 'Head of Department', 'ENG128'),
('vudinhst29', 'DinhST!789', 'Lecturer', 'ENG129'),
('nguyenvantu30', 'VanTU$2025', 'Exam Manager', 'Lecturer'),
('trannhanv31', 'NhanV_321', 'Lecturer', 'ENG131'),
('lethithw32', 'ThuHW#456', 'R&D Staff', 'ENG132'),
('phamquangx33', 'QuangX!789', 'Lecturer', 'ENG133'),
('vuthanhy34', 'ThanhY$2025', 'Lecturer', 'ENG134'),
('nguyenvanhz35', 'VanHZ_123', 'Exam Manager', 'ENG135'),
('trancuongaa36', 'CuongAA#456', 'Lecturer', 'ENG136'),
('leduyabb37', 'DuyABB!789', 'Lecturer', 'ENG137'),
('phamminhacc38', 'MinhACC$2025', 'Head of Department', 'ENG138'),
('vuledd39', 'LedD_321', 'Lecturer', 'ENG139'),
('nguyenhai40', 'Hai#456', 'Exam Manager', 'Lecturer'),
('tranhungff41', 'HungFF!789', 'Lecturer', 'ENG141'),
('leminhgg42', 'MinhGG$2025', 'Lecturer', 'ENG142'),
('phamhailh43', 'HaiLH_123', 'R&D Staff', 'ENG143'),
('vudangmm44', 'DangMM#456', 'Lecturer', 'ENG144'),
('nguyenvanno45', 'VanNO!789', 'Lecturer', 'ENG145'),
('tranthinhpp46', 'ThinhPP$2025', 'Exam Manager', 'Lecturer'),
('lethidanqq47', 'ThiDanQQ_321', 'Lecturer', 'ENG147'),
('phamquocrr48', 'QuocRR#456', 'R&D Staff', 'ENG148'),
('vuduys49', 'DuyS!789', 'Head of Department', 'ENG149'),
('nguyenvanss50', 'VanSS$2025', 'Lecturer', 'ENG150'),
('trananhvt51', 'AnhVT@123', 'Lecturer', 'ENG151'),
('leminhvv52', 'MinhVV#456', 'Head of Department', 'ENG152'),
('phamngocxx53', 'NgocXX$789', 'R&D Staff', 'Lecturer'),
('vulinhyy54', 'LinhYY!2025', 'Exam Manager', 'ENG154'),
('nguyenthanzz55', 'ThanhZZ@321', 'Lecturer', 'ENG155'),
('tranhoangaa56', 'HoangAA#456', 'Lecturer', 'ENG156'),
('lethihuongbb57', 'ThuongBB$789', 'R&D Staff', 'Head of Department'),
('phamquangcc58', 'QuangCC!2025', 'Lecturer', 'ENG158'),
('vudangdd59', 'DangDD@123', 'Lecturer', 'ENG159'),
('nguyenvanne60', 'VanNE#456', 'Exam Manager', 'Lecturer'),
('tranthinhff61', 'ThinhFF$789', 'Lecturer', 'ENG161'),
('lethidangg62', 'ThiDang!2025', 'R&D Staff', 'Head of Department'),
('phamquanghh63', 'QuangHH@321', 'Lecturer', 'ENG163'),
('vuthanhii64', 'ThanhII#456', 'Lecturer', 'Exam Manager'),
('nguyenvanjj65', 'VanJJ$789', 'Lecturer', 'ENG165'),
('tranduongkk66', 'DuongKK!2025', 'Lecturer', 'ENG166'),
('lethivv67', 'ThiVV@123', 'R&D Staff', 'Head of Department'),
('phamminhll68', 'MinhLL#456', 'Lecturer', 'ENG168'),
('vutranmm69', 'TranMM$789', 'Exam Manager', 'Lecturer'),
('nguyenvanno70', 'VanNO!2025', 'Lecturer', 'ENG170'),
('tranquangnn71', 'QuangNN@321', 'Lecturer', 'ENG171'),
('leminhoo72', 'MinhOO#456', 'R&D Staff', 'Head of Department'),
('phamquangpp73', 'QuangPP$789', 'Lecturer', 'ENG173'),
('vuduysqq74', 'DuyQQ!2025', 'Exam Manager', 'Lecturer'),
('nguyenvanss75', 'VanSS@123', 'Lecturer', 'ENG175'),
('trananhvt76', 'AnhVT#456', 'Lecturer', 'ENG176'),
('leminhvv77', 'MinhVV$789', 'Head of Department', 'ENG177'),
('phamngocxx78', 'NgocXX!2025', 'R&D Staff', 'Lecturer'),
('vulinhyy79', 'LinhYY@123', 'Exam Manager', 'ENG179'),
('nguyenthanzz80', 'ThanhZZ#456', 'Lecturer', 'ENG180'),
('tranhoangaa81', 'HoangAA$789', 'Lecturer', 'ENG181'),
('lethihuongbb82', 'ThuongBB@123', 'R&D Staff', 'Head of Department'),
('phamquangcc83', 'QuangCC#456', 'Lecturer', 'ENG183'),
('vudangdd84', 'DangDD$789', 'Lecturer', 'ENG184'),
('nguyenvanne85', 'VanNE!123', 'Exam Manager', 'Lecturer'),
('tranthinhff86', 'ThinhFF#456', 'Lecturer', 'ENG186'),
('lethidangg87', 'ThiDang$789', 'R&D Staff', 'Head of Department'),
('phamquanghh88', 'QuangHH!123', 'Lecturer', 'ENG188'),
('vuthanhii89', 'ThanhII$456', 'Lecturer', 'Exam Manager'),
('nguyenvanjj90', 'VanJJ!789', 'Lecturer', 'ENG190'),
('tranduongkk91', 'DuongKK@123', 'Lecturer', 'ENG191'),
('lethivv92', 'ThiVV#456', 'R&D Staff', 'Head of Department'),
('phamminhll93', 'MinhLL$789', 'Lecturer', 'ENG193'),
('vutranmm94', 'TranMM!123', 'Exam Manager', 'Lecturer'),
('nguyenvanno95', 'VanNO#456', 'Lecturer', 'ENG195'),
('tranquangnn96', 'QuangNN$789', 'Lecturer', 'ENG196'),
('leminhoo97', 'MinhOO!123', 'R&D Staff', 'Head of Department'),
('phamquangpp98', 'QuangPP#456', 'Lecturer', 'ENG198'),
('vuduysqq99', 'DuyQQ$789', 'Exam Manager', 'Lecturer'),
('nguyenvanss100', 'VanSS!123', 'Lecturer', 'ENG200');

Go

INSERT INTO Users (Username, Password, Role, Subject) VALUES
('nguyenanhthu', 'Pass1234!', 'Lecturer', 'ENG101'),
('tranminhhoa', 'HoaTran2025', 'Head of Department', 'ENG102'),
('lehoangnam', 'HoangNam@456', 'R&D Staff', 'ENG103'),
('phamthikim', 'KimPham#789', 'Exam Manager', 'ENG104'),
('vuhoanganh', 'AnhVu2025$', 'Lecturer', 'ENG105'),
('ngothithu', 'ThuNgo!2025', 'Lecturer', 'ENG106'),
('tranvanlong', 'LongTran_123', 'R&D Staff', 'ENG107'),
('phamminhduc', 'MinhDuc$321', 'Head of Department', 'ENG108'),
('lethithuy', 'ThuyLe#456', 'Lecturer', 'ENG109'),
('nguyenquanghuy', 'HuyNguyen@789', 'Exam Manager', 'ENG110'),
('nguyenvana', 'VanA1234$', 'Lecturer', 'ENG111'),
('tranvannb', 'VanNB@2025', 'Head of Department', 'ENG112'),
('lequocbao', 'QuocBao#456', 'R&D Staff', 'ENG113'),
('phamhongc', 'HongC789!', 'Lecturer', 'ENG114'),
('vutrongd', 'TrongD$2025', 'Lecturer', 'ENG115'),
('nguyenthanh', 'ThanhNgo!321', 'R&D Staff', 'ENG116'),
('tranminhe', 'MinhE_456', 'Head of Department', 'ENG117'),
('phamphucf', 'PhucF$789', 'Lecturer', 'ENG118'),
('lethithug', 'ThuG#123', 'Exam Manager', 'ENG119'),
('nguyenvanhh', 'VanHH@456', 'Lecturer', 'ENG120'),
('tranvannk', 'VanNK!789', 'Lecturer', 'ENG121'),
('lequoch', 'QuocH$2025', 'Head of Department', 'ENG122'),
('phamminhdk', 'MinhDK_321', 'Lecturer', 'ENG123'),
('vutranlh', 'TranLH#456', 'Exam Manager', 'ENG124'),
('nguyenvanto', 'VanTo!789', 'Lecturer', 'ENG125'),
('tranthikp', 'ThiKP$2025', 'Lecturer', 'ENG126'),
('lehoangtq', 'HoangTQ_123', 'R&D Staff', 'ENG127'),
('phamdangr', 'DangR#456', 'Head of Department', 'ENG128'),
('vudinhst', 'DinhST!789', 'Lecturer', 'ENG129'),
('nguyenvantu', 'VanTU$2025', 'Exam Manager', 'Lecturer'),
('trannhanv', 'NhanV_321', 'Lecturer', 'ENG131'),
('lethithw', 'ThuHW#456', 'R&D Staff', 'ENG132'),
('phamquangx', 'QuangX!789', 'Lecturer', 'ENG133'),
('vuthanhy', 'ThanhY$2025', 'Lecturer', 'ENG134'),
('nguyenvanhz', 'VanHZ_123', 'Exam Manager', 'ENG135'),
('trancuongaa', 'CuongAA#456', 'Lecturer', 'ENG136'),
('leduyabb', 'DuyABB!789', 'Lecturer', 'ENG137'),
('phamminhacc', 'MinhACC$2025', 'Head of Department', 'ENG138'),
('vuledd', 'LedD_321', 'Lecturer', 'ENG139'),
('nguyenhai', 'Hai#456', 'Exam Manager', 'Lecturer'),
('tranhungff', 'HungFF!789', 'Lecturer', 'ENG141'),
('leminhgg', 'MinhGG$2025', 'Lecturer', 'ENG142'),
('phamhailh', 'HaiLH_123', 'R&D Staff', 'ENG143'),
('vudangmm', 'DangMM#456', 'Lecturer', 'ENG144'),
('nguyenvanno', 'VanNO!789', 'Lecturer', 'ENG145'),
('tranthinhpp', 'ThinhPP$2025', 'Exam Manager', 'Lecturer'),
('lethidanqq', 'ThiDanQQ_321', 'Lecturer', 'ENG147'),
('phamquocrr', 'QuocRR#456', 'R&D Staff', 'ENG148'),
('vuduys', 'DuyS!789', 'Head of Department', 'ENG149'),
('nguyenvanss', 'VanSS$2025', 'Lecturer', 'ENG150'),
('trananhvt', 'AnhVT@123', 'Lecturer', 'ENG151'),
('leminhvv', 'MinhVV#456', 'Head of Department', 'ENG152'),
('phamngocxx', 'NgocXX$789', 'R&D Staff', 'Lecturer'),
('vulinhyy', 'LinhYY!2025', 'Exam Manager', 'ENG154'),
('nguyenthanzz', 'ThanhZZ@321', 'Lecturer', 'ENG155'),
('tranhoangaa', 'HoangAA#456', 'Lecturer', 'ENG156'),
('lethihuongbb', 'ThuongBB$789', 'R&D Staff', 'Head of Department'),
('phamquangcc', 'QuangCC!2025', 'Lecturer', 'ENG158'),
('vudangdd', 'DangDD@123', 'Lecturer', 'ENG159'),
('nguyenvanne', 'VanNE#456', 'Exam Manager', 'Lecturer'),
('tranthinhff', 'ThinhFF$789', 'Lecturer', 'ENG161'),
('lethidangg', 'ThiDang!2025', 'R&D Staff', 'Head of Department'),
('phamquanghh', 'QuangHH@321', 'Lecturer', 'ENG163'),
('vuthanhii', 'ThanhII#456', 'Lecturer', 'Exam Manager'),
('nguyenvanjj', 'VanJJ$789', 'Lecturer', 'ENG165'),
('tranduongkk', 'DuongKK!2025', 'Lecturer', 'ENG166'),
('lethivv', 'ThiVV@123', 'R&D Staff', 'Head of Department'),
('phamminhll', 'MinhLL#456', 'Lecturer', 'ENG168'),
('vutranmm', 'TranMM$789', 'Exam Manager', 'Lecturer'),
('nguyenvanno', 'VanNO!2025', 'Lecturer', 'ENG170'),
('tranquangnn', 'QuangNN@321', 'Lecturer', 'ENG171'),
('leminhoo', 'MinhOO#456', 'R&D Staff', 'Head of Department'),
('phamquangpp', 'QuangPP$789', 'Lecturer', 'ENG173'),
('vuduysqq', 'DuyQQ!2025', 'Exam Manager', 'Lecturer'),
('nguyenvanss', 'VanSS@123', 'Lecturer', 'ENG175'),
('trananhvt', 'AnhVT#456', 'Lecturer', 'ENG176'),
('leminhvv', 'MinhVV$789', 'Head of Department', 'ENG177'),
('phamngocxx', 'NgocXX!2025', 'R&D Staff', 'Lecturer'),
('vulinhyy', 'LinhYY@123', 'Exam Manager', 'ENG179'),
('nguyenthanzz', 'ThanhZZ#456', 'Lecturer', 'ENG180'),
('tranhoangaa', 'HoangAA$789', 'Lecturer', 'ENG181'),
('lethihuongbb', 'ThuongBB@123', 'R&D Staff', 'Head of Department'),
('phamquangcc', 'QuangCC#456', 'Lecturer', 'ENG183'),
('vudangdd', 'DangDD$789', 'Lecturer', 'ENG184'),
('nguyenvanne', 'VanNE!123', 'Exam Manager', 'Lecturer'),
('tranthinhff', 'ThinhFF#456', 'Lecturer', 'ENG186'),
('lethidangg', 'ThiDang$789', 'R&D Staff', 'Head of Department'),
('phamquanghh', 'QuangHH!123', 'Lecturer', 'ENG188'),
('vuthanhii', 'ThanhII$456', 'Lecturer', 'Exam Manager'),
('nguyenvanjj', 'VanJJ!789', 'Lecturer', 'ENG190'),
('tranduongkk', 'DuongKK@123', 'Lecturer', 'ENG191'),
('lethivv', 'ThiVV#456', 'R&D Staff', 'Head of Department'),
('phamminhll', 'MinhLL$789', 'Lecturer', 'ENG193'),
('vutranmm', 'TranMM!123', 'Exam Manager', 'Lecturer'),
('nguyenvanno', 'VanNO#456', 'Lecturer', 'ENG195'),
('tranquangnn', 'QuangNN$789', 'Lecturer', 'ENG196'),
('leminhoo', 'MinhOO!123', 'R&D Staff', 'Head of Department'),
('phamquangpp', 'QuangPP#456', 'Lecturer', 'ENG198'),
('vuduysqq', 'DuyQQ$789', 'Exam Manager', 'Lecturer'),
('nguyenvanss', 'VanSS!123', 'Lecturer', 'ENG200');
Go

INSERT INTO Users (Username, Password, Role, Subject) VALUES
('nguyenanhthu', 'Pass1234!', 'Lecturer', 'ENG101'),
('tranminhhoa', 'HoaTran2025', 'Head of Department', 'ENG102'),
('lehoangnam', 'HoangNam@456', 'R&D Staff', 'ENG103'),
('phamthikim', 'KimPham#789', 'Exam Manager', 'ENG104'),
('vuhoanganh', 'AnhVu2025$', 'Lecturer', 'ENG105'),
('ngothithu', 'ThuNgo!2025', 'Lecturer', 'ENG106'),
('tranvanlong', 'LongTran_123', 'R&D Staff', 'ENG107'),
('phamminhduc', 'MinhDuc$321', 'Head of Department', 'ENG108'),
('lethithuy', 'ThuyLe#456', 'Lecturer', 'ENG109'),
('nguyenquanghuy', 'HuyNguyen@789', 'Exam Manager', 'ENG110'),
('nguyenvana', 'VanA1234$', 'Lecturer', 'ENG111'),
('tranvannb', 'VanNB@2025', 'Head of Department', 'ENG112'),
('lequocbao', 'QuocBao#456', 'R&D Staff', 'ENG113'),
('phamhongc', 'HongC789!', 'Lecturer', 'ENG114'),
('vutrongd', 'TrongD$2025', 'Lecturer', 'ENG115'),
('nguyenthanh', 'ThanhNgo!321', 'R&D Staff', 'ENG116'),
('tranminhe', 'MinhE_456', 'Head of Department', 'ENG117'),
('phamphucf', 'PhucF$789', 'Lecturer', 'ENG118'),
('lethithug', 'ThuG#123', 'Exam Manager', 'ENG119'),
('nguyenvanhh', 'VanHH@456', 'Lecturer', 'ENG120'),
('tranvannk', 'VanNK!789', 'Lecturer', 'ENG121'),
('lequoch', 'QuocH$2025', 'Head of Department', 'ENG122'),
('phamminhdk', 'MinhDK_321', 'Lecturer', 'ENG123'),
('vutranlh', 'TranLH#456', 'Exam Manager', 'ENG124'),
('nguyenvanto', 'VanTo!789', 'Lecturer', 'ENG125'),
('tranthikp', 'ThiKP$2025', 'Lecturer', 'ENG126'),
('lehoangtq', 'HoangTQ_123', 'R&D Staff', 'ENG127'),
('phamdangr', 'DangR#456', 'Head of Department', 'ENG128'),
('vudinhst', 'DinhST!789', 'Lecturer', 'ENG129'),
('nguyenvantu', 'VanTU$2025', 'Exam Manager', 'Lecturer'),
('trannhanv', 'NhanV_321', 'Lecturer', 'ENG131'),
('lethithw', 'ThuHW#456', 'R&D Staff', 'ENG132'),
('phamquangx', 'QuangX!789', 'Lecturer', 'ENG133'),
('vuthanhy', 'ThanhY$2025', 'Lecturer', 'ENG134'),
('nguyenvanhz', 'VanHZ_123', 'Exam Manager', 'ENG135'),
('trancuongaa', 'CuongAA#456', 'Lecturer', 'ENG136'),
('leduyabb', 'DuyABB!789', 'Lecturer', 'ENG137'),
('phamminhacc', 'MinhACC$2025', 'Head of Department', 'ENG138'),
('vuledd', 'LedD_321', 'Lecturer', 'ENG139'),
('nguyenhai', 'Hai#456', 'Exam Manager', 'Lecturer'),
('tranhungff', 'HungFF!789', 'Lecturer', 'ENG141'),
('leminhgg', 'MinhGG$2025', 'Lecturer', 'ENG142'),
('phamhailh', 'HaiLH_123', 'R&D Staff', 'ENG143'),
('vudangmm', 'DangMM#456', 'Lecturer', 'ENG144'),
('nguyenvanno', 'VanNO!789', 'Lecturer', 'ENG145'),
('tranthinhpp', 'ThinhPP$2025', 'Exam Manager', 'Lecturer'),
('lethidanqq', 'ThiDanQQ_321', 'Lecturer', 'ENG147'),
('phamquocrr', 'QuocRR#456', 'R&D Staff', 'ENG148'),
('vuduys', 'DuyS!789', 'Head of Department', 'ENG149'),
('nguyenvanss', 'VanSS$2025', 'Lecturer', 'ENG150'),
('trananhvt', 'AnhVT@123', 'Lecturer', 'ENG151'),
('leminhvv', 'MinhVV#456', 'Head of Department', 'ENG152'),
('phamngocxx', 'NgocXX$789', 'R&D Staff', 'Lecturer'),
('vulinhyy', 'LinhYY!2025', 'Exam Manager', 'ENG154'),
('nguyenthanzz', 'ThanhZZ@321', 'Lecturer', 'ENG155'),
('tranhoangaa', 'HoangAA#456', 'Lecturer', 'ENG156'),
('lethihuongbb', 'ThuongBB$789', 'R&D Staff', 'Head of Department'),
('phamquangcc', 'QuangCC!2025', 'Lecturer', 'ENG158'),
('vudangdd', 'DangDD@123', 'Lecturer', 'ENG159'),
('nguyenvanne', 'VanNE#456', 'Exam Manager', 'Lecturer'),
('tranthinhff', 'ThinhFF$789', 'Lecturer', 'ENG161'),
('lethidangg', 'ThiDang!2025', 'R&D Staff', 'Head of Department'),
('phamquanghh', 'QuangHH@321', 'Lecturer', 'ENG163'),
('vuthanhii', 'ThanhII#456', 'Lecturer', 'Exam Manager'),
('nguyenvanjj', 'VanJJ$789', 'Lecturer', 'ENG165'),
('tranduongkk', 'DuongKK!2025', 'Lecturer', 'ENG166'),
('lethivv', 'ThiVV@123', 'R&D Staff', 'Head of Department'),
('phamminhll', 'MinhLL#456', 'Lecturer', 'ENG168'),
('vutranmm', 'TranMM$789', 'Exam Manager', 'Lecturer'),
('nguyenvanno', 'VanNO!2025', 'Lecturer', 'ENG170'),
('tranquangnn', 'QuangNN@321', 'Lecturer', 'ENG171'),
('leminhoo', 'MinhOO#456', 'R&D Staff', 'Head of Department'),
('phamquangpp', 'QuangPP$789', 'Lecturer', 'ENG173'),
('vuduysqq', 'DuyQQ!2025', 'Exam Manager', 'Lecturer'),
('nguyenvanss', 'VanSS@123', 'Lecturer', 'ENG175'),
('trananhvt', 'AnhVT#456', 'Lecturer', 'ENG176'),
('leminhvv', 'MinhVV$789', 'Head of Department', 'ENG177'),
('phamngocxx', 'NgocXX!2025', 'R&D Staff', 'Lecturer'),
('vulinhyy', 'LinhYY@123', 'Exam Manager', 'ENG179'),
('nguyenthanzz', 'ThanhZZ#456', 'Lecturer', 'ENG180'),
('tranhoangaa', 'HoangAA$789', 'Lecturer', 'ENG181'),
('lethihuongbb', 'ThuongBB@123', 'R&D Staff', 'Head of Department'),
('phamquangcc', 'QuangCC#456', 'Lecturer', 'ENG183'),
('vudangdd', 'DangDD$789', 'Lecturer', 'ENG184'),
('nguyenvanne', 'VanNE!123', 'Exam Manager', 'Lecturer'),
('tranthinhff', 'ThinhFF#456', 'Lecturer', 'ENG186'),
('lethidangg', 'ThiDang$789', 'R&D Staff', 'Head of Department'),
('phamquanghh', 'QuangHH!123', 'Lecturer', 'ENG188'),
('vuthanhii', 'ThanhII$456', 'Lecturer', 'Exam Manager'),
('nguyenvanjj', 'VanJJ!789', 'Lecturer', 'ENG190'),
('tranduongkk', 'DuongKK@123', 'Lecturer', 'ENG191'),
('lethivv', 'ThiVV#456', 'R&D Staff', 'Head of Department'),
('phamminhll', 'MinhLL$789', 'Lecturer', 'ENG193'),
('vutranmm', 'TranMM!123', 'Exam Manager', 'Lecturer'),
('nguyenvanno', 'VanNO#456', 'Lecturer', 'ENG195'),
('tranquangnn', 'QuangNN$789', 'Lecturer', 'ENG196'),
('leminhoo', 'MinhOO!123', 'R&D Staff', 'Head of Department'),
('phamquangpp', 'QuangPP#456', 'Lecturer', 'ENG198'),
('vuduysqq', 'DuyQQ$789', 'Exam Manager', 'Lecturer'),
('nguyenvanss', 'VanSS!123', 'Lecturer', 'ENG200');
Go

INSERT INTO Users (Username, Password, Role, Subject) VALUES
('ngocanh', 'NgocAnh123!', 'Lecturer', 'ENG201'),
('thanhbinh', 'ThanhBinh@2025', 'Head of Department', 'ENG202'),
('minhchau', 'MinhChau#456', 'R&D Staff', 'ENG203'),
('hanhdao', 'HanhDao$789', 'Exam Manager', 'ENG204'),
('phucgiang', 'PhucGiang!2025', 'Lecturer', 'ENG205'),
('dieuhanh', 'DieuHanh_123', 'Lecturer', 'ENG206'),
('honglam', 'HongLam@456', 'R&D Staff', 'ENG207'),
('ducmanh', 'DucManh#789', 'Head of Department', 'ENG208'),
('thuynga', 'ThuyNga$2025', 'Lecturer', 'ENG209'),
('quangphuc', 'QuangPhuc!321', 'Exam Manager', 'ENG210'),
('linhquang', 'LinhQuang_456', 'Lecturer', 'ENG211'),
('thanhquy', 'ThanhQuy#789', 'Lecturer', 'ENG212'),
('minhthu', 'MinhThu$2025', 'R&D Staff', 'ENG213'),
('dangtuan', 'DangTuan!123', 'Lecturer', 'ENG214'),
('quocvinh', 'QuocVinh@456', 'Head of Department', 'ENG215'),
('tranhung', 'TranHung#789', 'Lecturer', 'ENG216'),
('quanghuy', 'QuangHuy$2025', 'Lecturer', 'ENG217'),
('honganh', 'HongAnh!321', 'Exam Manager', 'ENG218'),
('thanhbao', 'ThanhBao_456', 'Lecturer', 'ENG219'),
('vanbinh', 'VanBinh#789', 'Lecturer', 'ENG220'),
('minhcuong', 'MinhCuong$2025', 'Head of Department', 'ENG221'),
('hangdao', 'HangDao!123', 'Lecturer', 'ENG222'),
('thanhhien', 'ThanhHien@456', 'R&D Staff', 'ENG223'),
('phuclinh', 'PhucLinh#789', 'Lecturer', 'ENG224'),
('huyenmai', 'HuyenMai$2025', 'Lecturer', 'ENG225'),
('quocnam', 'QuocNam!321', 'Exam Manager', 'ENG226'),
('thanhnga', 'ThanhNga_456', 'Lecturer', 'ENG227'),
('minhphuc', 'MinhPhuc#789', 'Lecturer', 'ENG228'),
('hongquang', 'HongQuang$2025', 'R&D Staff', 'ENG229'),
('vinhthanh', 'VinhThanh!123', 'Head of Department', 'ENG230'),
('thanhtrang', 'ThanhTrang@456', 'Lecturer', 'ENG231'),
('quangvinh', 'QuangVinh#789', 'Lecturer', 'ENG232'),
('minhvu', 'MinhVu$2025', 'Exam Manager', 'ENG233'),
('hanhnguyen', 'HanhNguyen!321', 'Lecturer', 'ENG234'),
('thuyanh', 'ThuyAnh_456', 'Lecturer', 'ENG235'),
('quocbinh', 'QuocBinh#789', 'R&D Staff', 'ENG236'),
('dinhchinh', 'DinhChinh$2025', 'Lecturer', 'ENG237'),
('hongduong', 'HongDuong!123', 'Lecturer', 'ENG238'),
('phucloi', 'PhucLoi@456', 'Exam Manager', 'ENG239'),
('minhngoc', 'MinhNgoc#789', 'Lecturer', 'ENG240'),
('quangphuong', 'QuangPhuong$2025', 'Head of Department', 'ENG241'),
('thanhson', 'ThanhSon!321', 'Lecturer', 'ENG242'),
('vinhthao', 'VinhThao_456', 'Lecturer', 'ENG243'),
('minhtu', 'MinhTu#789', 'R&D Staff', 'ENG244'),
('hanhvy', 'HanhVy$2025', 'Lecturer', 'ENG245'),
('thuyhong', 'ThuyHong!123', 'Exam Manager', 'ENG246'),
('quochung', 'QuocHung@456', 'Lecturer', 'ENG247'),
('minhduc', 'MinhDuc#789', 'Lecturer', 'ENG248'),
('hanhkim', 'HanhKim$2025', 'R&D Staff', 'ENG249'),
('thuylan', 'ThuyLan!321', 'Head of Department', 'ENG250'),
('quangnam', 'QuangNam_456', 'Lecturer', 'ENG251'),
('vinhphat', 'VinhPhat#789', 'Lecturer', 'ENG252'),
('minhquan', 'MinhQuan$2025', 'Exam Manager', 'ENG253'),
('hanhsang', 'HanhSang!123', 'Lecturer', 'ENG254'),
('thuythao', 'ThuyThao@456', 'Lecturer', 'ENG255'),
('quangtrung', 'QuangTrung#789', 'R&D Staff', 'ENG256'),
('minhvy', 'MinhVy$2025', 'Lecturer', 'ENG257'),
('vinhxuân', 'VinhXuan!321', 'Lecturer', 'ENG258'),
('hanhyen', 'HanhYen_456', 'Exam Manager', 'ENG259'),
('thuyanh', 'ThuyAnh#789', 'Lecturer', 'ENG260'),
('quochai', 'QuocHai$2025', 'Lecturer', 'ENG261'),
('minhhieu', 'MinhHieu!123', 'Head of Department', 'ENG262'),
('hanhhoa', 'HanhHoa@456', 'Lecturer', 'ENG263'),
('thuykien', 'ThuyKien#789', 'Lecturer', 'ENG264'),
('quanglam', 'QuangLam$2025', 'R&D Staff', 'ENG265'),
('minhlinh', 'MinhLinh!321', 'Lecturer', 'ENG266'),
('vinhmai', 'VinhMai_456', 'Exam Manager', 'ENG267'),
('hanhngoc', 'HanhNgoc#789', 'Lecturer', 'ENG268'),
('thuyphuong', 'ThuyPhuong$2025', 'Lecturer', 'ENG269'),
('quangquy', 'QuangQuy!123', 'Head of Department', 'ENG270'),
('minhthanh', 'MinhThanh@456', 'Lecturer', 'ENG271'),
('hanhtrang', 'HanhTrang#789', 'Lecturer', 'ENG272'),
('thuyvan', 'ThuyVan$2025', 'R&D Staff', 'ENG273'),
('quangvinh', 'QuangVinh!321', 'Lecturer', 'ENG274'),
('minhvuong', 'MinhVuong_456', 'Lecturer', 'ENG275'),
('hanhvy', 'HanhVy#789', 'Exam Manager', 'ENG276'),
('thuyyen', 'ThuyYen$2025', 'Lecturer', 'ENG277'),
('quangzai', 'QuangZai!123', 'Lecturer', 'ENG278'),
('minhhung', 'MinhHung@456', 'Head of Department', 'ENG279'),
('hanhphuc', 'HanhPhuc#789', 'Lecturer', 'ENG280'),
('thuyanh', 'ThuyAnh$2025', 'Lecturer', 'ENG281'),
('quocanh', 'QuocAnh!321', 'R&D Staff', 'ENG282'),
('minhbao', 'MinhBao_456', 'Lecturer', 'ENG283'),
('hanhcuong', 'HanhCuong#789', 'Exam Manager', 'ENG284'),
('thuyduong', 'ThuyDuong$2025', 'Lecturer', 'ENG285'),
('quanghieu', 'QuangHieu!123', 'Lecturer', 'ENG286'),
('minhhai', 'MinhHai@456', 'Head of Department', 'ENG287'),
('hanhhoa', 'HanhHoa#789', 'Lecturer', 'ENG288'),
('thuykhanh', 'ThuyKhanh$2025', 'Lecturer', 'ENG289'),
('quanglam', 'QuangLam!321', 'R&D Staff', 'ENG290'),
('minhlinh', 'MinhLinh_456', 'Lecturer', 'ENG291'),
('vinhmai', 'VinhMai#789', 'Exam Manager', 'ENG292'),
('hanhngoc', 'HanhNgoc$2025', 'Lecturer', 'ENG293'),
('thuyphuong', 'ThuyPhuong!123', 'Lecturer', 'ENG294'),
('quangquy', 'QuangQuy@456', 'Head of Department', 'ENG295'),
('minhthanh', 'MinhThanh#789', 'Lecturer', 'ENG296'),
('hanhtrang', 'HanhTrang$2025', 'Lecturer', 'ENG297'),
('thuyvan', 'ThuyVan!321', 'R&D Staff', 'ENG298'),
('quangvinh', 'QuangVinh_456', 'Lecturer', 'ENG299'),
('minhvuong', 'MinhVuong#789', 'Lecturer', 'ENG300');
Go

INSERT INTO Users (Username, Password, Role, Subject) VALUES
('nguyenanhthu', 'Pass1234!', 'Lecturer', 'ENG101'),
('tranminhhoa', 'HoaTran2025', 'Head of Department', 'ENG102'),
('lehoangnam', 'HoangNam@456', 'R&D Staff', 'ENG103'),
('phamthikim', 'KimPham#789', 'Exam Manager', 'ENG104'),
('vuhoanganh', 'AnhVu2025$', 'Lecturer', 'ENG105'),
('ngothithu', 'ThuNgo!2025', 'Lecturer', 'ENG106'),
('tranvanlong', 'LongTran_123', 'R&D Staff', 'ENG107'),
('phamminhduc', 'MinhDuc$321', 'Head of Department', 'ENG108'),
('lethithuy', 'ThuyLe#456', 'Lecturer', 'ENG109'),
('nguyenquanghuy', 'HuyNguyen@789', 'Exam Manager', 'ENG110'),
('nguyenvana', 'VanA1234$', 'Lecturer', 'ENG111'),
('tranvannb', 'VanNB@2025', 'Head of Department', 'ENG112'),
('lequocbao', 'QuocBao#456', 'R&D Staff', 'ENG113'),
('phamhongc', 'HongC789!', 'Lecturer', 'ENG114'),
('vutrongd', 'TrongD$2025', 'Lecturer', 'ENG115'),
('nguyenthanh', 'ThanhNgo!321', 'R&D Staff', 'ENG116'),
('tranminhe', 'MinhE_456', 'Head of Department', 'ENG117'),
('phamphucf', 'PhucF$789', 'Lecturer', 'ENG118'),
('lethithug', 'ThuG#123', 'Exam Manager', 'ENG119'),
('nguyenvanhh', 'VanHH@456', 'Lecturer', 'ENG120'),
('tranvannk', 'VanNK!789', 'Lecturer', 'ENG121'),
('lequoch', 'QuocH$2025', 'Head of Department', 'ENG122'),
('phamminhdk', 'MinhDK_321', 'Lecturer', 'ENG123'),
('vutranlh', 'TranLH#456', 'Exam Manager', 'ENG124'),
('nguyenvanto', 'VanTo!789', 'Lecturer', 'ENG125'),
('tranthikp', 'ThiKP$2025', 'Lecturer', 'ENG126'),
('lehoangtq', 'HoangTQ_123', 'R&D Staff', 'ENG127'),
('phamdangr', 'DangR#456', 'Head of Department', 'ENG128'),
('vudinhst', 'DinhST!789', 'Lecturer', 'ENG129'),
('nguyenvantu', 'VanTU$2025', 'Exam Manager', 'ENG130'),
('trannhanv', 'NhanV_321', 'Lecturer', 'ENG131'),
('lethithw', 'ThuHW#456', 'R&D Staff', 'ENG132'),
('phamquangx', 'QuangX!789', 'Lecturer', 'ENG133'),
('vuthanhy', 'ThanhY$2025', 'Lecturer', 'ENG134'),
('nguyenvanhz', 'VanHZ_123', 'Exam Manager', 'ENG135'),
('trancuongaa', 'CuongAA#456', 'Lecturer', 'ENG136'),
('leduyabb', 'DuyABB!789', 'Lecturer', 'ENG137'),
('phamminhacc', 'MinhACC$2025', 'Head of Department', 'ENG138'),
('vuledd', 'LedD_321', 'Lecturer', 'ENG139'),
('nguyenhai', 'Hai#456', 'Exam Manager', 'ENG140'),
('tranhungff', 'HungFF!789', 'Lecturer', 'ENG141'),
('leminhgg', 'MinhGG$2025', 'Lecturer', 'ENG142'),
('phamhailh', 'HaiLH_123', 'R&D Staff', 'ENG143'),
('vudangmm', 'DangMM#456', 'Lecturer', 'ENG144'),
('nguyenvanno', 'VanNO!789', 'Lecturer', 'ENG145'),
('tranthinhpp', 'ThinhPP$2025', 'Exam Manager', 'ENG146'),
('lethidanqq', 'ThiDanQQ_321', 'Lecturer', 'ENG147'),
('phamquocrr', 'QuocRR#456', 'R&D Staff', 'ENG148'),
('vuduys', 'DuyS!789', 'Head of Department', 'ENG149'),
('nguyenvanss', 'VanSS$2025', 'Lecturer', 'ENG150'),
('trananhvt', 'AnhVT@123', 'Lecturer', 'ENG151'),
('leminhvv', 'MinhVV#456', 'Head of Department', 'ENG152'),
('phamngocxx', 'NgocXX$789', 'R&D Staff', 'LECT153'),
('vulinhyy', 'LinhYY!2025', 'Exam Manager', 'ENG154'),
('nguyenthanzz', 'ThanhZZ@321', 'Lecturer', 'ENG155'),
('tranhoangaa', 'HoangAA#456', 'Lecturer', 'ENG156'),
('lethihuongbb', 'ThuongBB$789', 'R&D Staff', 'HEAD157'),
('phamquangcc', 'QuangCC!2025', 'Lecturer', 'ENG158'),
('vudangdd', 'DangDD@123', 'Lecturer', 'ENG159'),
('nguyenvanne', 'VanNE#456', 'Exam Manager', 'LECT160'),
('tranthinhff', 'ThinhFF$789', 'Lecturer', 'ENG161'),
('lethidangg', 'ThiDang!2025', 'R&D Staff', 'HEAD162'),
('phamquanghh', 'QuangHH@321', 'Lecturer', 'ENG163'),
('vuthanhii', 'ThanhII#456', 'Lecturer', 'Exam Manager'),
('nguyenvanjj', 'VanJJ$789', 'Lecturer', 'ENG165'),
('tranduongkk', 'DuongKK!2025', 'Lecturer', 'ENG166'),
('lethivv', 'ThiVV@123', 'R&D Staff', 'HEAD167'),
('phamminhll', 'MinhLL#456', 'Lecturer', 'ENG168'),
('vutranmm', 'TranMM$789', 'Exam Manager', 'LECT169'),
('nguyenvanno', 'VanNO!2025', 'Lecturer', 'ENG170'),
('tranquangnn', 'QuangNN@321', 'Lecturer', 'ENG171'),
('leminhoo', 'MinhOO#456', 'R&D Staff', 'HEAD172'),
('phamquangpp', 'QuangPP$789', 'Lecturer', 'ENG173'),
('vuduysqq', 'DuyQQ!2025', 'Exam Manager', 'LECT174'),
('nguyenvanss', 'VanSS@123', 'Lecturer', 'ENG175'),
('trananhvt', 'AnhVT#456', 'Lecturer', 'ENG176'),
('leminhvv', 'MinhVV$789', 'Head of Department', 'ENG177'),
('phamngocxx', 'NgocXX!2025', 'R&D Staff', 'LECT178'),
('vulinhyy', 'LinhYY@123', 'Exam Manager', 'ENG179'),
('nguyenthanzz', 'ThanhZZ#456', 'Lecturer', 'ENG180'),
('tranhoangaa', 'HoangAA$789', 'Lecturer', 'ENG181'),
('lethihuongbb', 'ThuongBB@123', 'R&D Staff', 'HEAD182'),
('phamquangcc', 'QuangCC#456', 'Lecturer', 'ENG183'),
('vudangdd', 'DangDD$789', 'Lecturer', 'ENG184'),
('nguyenvanne', 'VanNE!123', 'Exam Manager', 'LECT185'),
('tranthinhff', 'ThinhFF#456', 'Lecturer', 'ENG186'),
('lethidangg', 'ThiDang$789', 'R&D Staff', 'HEAD187'),
('phamquanghh', 'QuangHH!123', 'Lecturer', 'ENG188'),
('vuthanhii', 'ThanhII$456', 'Lecturer', 'Exam Manager'),
('nguyenvanjj', 'VanJJ!789', 'Lecturer', 'ENG190'),
('tranduongkk', 'DuongKK@123', 'Lecturer', 'ENG191'),
('lethivv', 'ThiVV#456', 'R&D Staff', 'HEAD192'),
('phamminhll', 'MinhLL$789', 'Lecturer', 'ENG193'),
('vutranmm', 'TranMM!123', 'Exam Manager', 'LECT194'),
('nguyenvanno', 'VanNO#456', 'Lecturer', 'ENG195'),
('tranquangnn', 'QuangNN$789', 'Lecturer', 'ENG196'),
('leminhoo', 'MinhOO!123', 'R&D Staff', 'HEAD197'),
('phamquangpp', 'QuangPP#456', 'Lecturer', 'ENG198'),
('vuduysqq', 'DuyQQ$789', 'Exam Manager', 'LECT199'),
('nguyenvanss', 'VanSS!123', 'Lecturer', 'ENG200');
Go





INSERT INTO Subject (SubjectID, SubjectName, CLOs, DifficultyLevel) VALUES
('SUBJECT001','English Question Bank Management','CLO1 Understand the structure of English question banks CLO2 Analyze and construct English questions effectively','Intermediate'),
('SUBJECT002','Natural Language Processing','CLO1 Understand core NLP techniques CLO2 Apply NLP for semantic analysis','Advanced'),
('SUBJECT003','Artificial Intelligence in Education','CLO1 Apply AI methods in educational contexts CLO2 Develop systems to detect semantic duplication in questions','Advanced'),
('SUBJECT004','Software Testing and Quality Assurance','CLO1 Understand software testing processes CLO2 Detect errors and duplicates in software systems','Intermediate'),
('SUBJECT005','Examination and Assessment Management','CLO1 Design examination systems CLO2 Ensure quality and fairness in assessments','Intermediate'),
('SUBJECT006','AI Software Development','CLO1 Develop AI applications CLO2 Apply AI for question analysis and duplication detection','Advanced'),
('SUBJECT007','Algorithms and Data Structures','CLO1 Understand basic algorithms and data structures CLO2 Use them in data processing tasks','Intermediate'),
('SUBJECT008','Data Analysis and Data Mining','CLO1 Analyze data sets CLO2 Extract useful information from question databases','Intermediate'),
('SUBJECT009','Human-Computer Interaction','CLO1 Design user interfaces CLO2 Automate question analysis processes','Intermediate'),
('SUBJECT010','Information Security in Education Systems','CLO1 Protect question data CLO2 Understand security measures in educational software','Advanced'),
('SUBJECT011','Applied Software Engineering','CLO1 Develop software solutions CLO2 Manage question bank systems','Intermediate'),
('SUBJECT012','English Language Processing','CLO1 Analyze English questions CLO2 Detect semantic duplication','Advanced'),
('SUBJECT013','Computer Science Fundamentals','CLO1 Understand core computer concepts CLO2 Apply in question management systems','Intermediate'),
('SUBJECT014','Operating Systems','CLO1 Manage system resources CLO2 Support software operations','Advanced'),
('SUBJECT015','Object-Oriented Programming','CLO1 Develop applications using OOP CLO2 Design modular question bank systems','Intermediate'),
('SUBJECT016','Machine Learning','CLO1 Understand machine learning algorithms CLO2 Apply ML to detect question similarities','Advanced'),
('SUBJECT017','Database Systems','CLO1 Design and query databases CLO2 Manage question repositories','Intermediate'),
('SUBJECT018','Software Project Management','CLO1 Plan and manage software projects CLO2 Ensure timely delivery of question bank software','Intermediate'),
('SUBJECT019','Text Mining','CLO1 Extract patterns from text data CLO2 Detect duplicate questions semantically','Advanced'),
('SUBJECT020','Data Visualization','CLO1 Present data visually CLO2 Analyze question bank statistics','Intermediate'),
('SUBJECT021','Cloud Computing for Education','CLO1 Use cloud platforms CLO2 Deploy scalable question management systems','Intermediate'),
('SUBJECT022','Big Data Analytics','CLO1 Process large datasets CLO2 Analyze question bank content effectively','Advanced'),
('SUBJECT023','Software Architecture','CLO1 Design software systems CLO2 Develop modular question bank software','Intermediate'),
('SUBJECT024','Semantic Web Technologies','CLO1 Understand semantic web principles CLO2 Apply for question similarity detection','Advanced'),
('SUBJECT025','Information Retrieval','CLO1 Retrieve relevant data CLO2 Search and compare questions','Intermediate'),
('SUBJECT026','Data Structures and Algorithms','CLO1 Implement efficient algorithms CLO2 Optimize question matching processes','Intermediate'),
('SUBJECT027','Knowledge Representation','CLO1 Model knowledge bases CLO2 Represent questions semantically','Advanced'),
('SUBJECT028','Computer Networks','CLO1 Understand network protocols CLO2 Support distributed question systems','Intermediate'),
('SUBJECT029','Cybersecurity Fundamentals','CLO1 Protect software systems CLO2 Ensure security of question banks','Advanced'),
('SUBJECT030','Educational Technology','CLO1 Apply tech in education CLO2 Develop smart question systems','Intermediate'),
('SUBJECT031','Speech Recognition Technologies','CLO1 Understand speech processing CLO2 Apply to question input methods','Advanced'),
('SUBJECT032','Computer Vision','CLO1 Process visual data CLO2 Support image-based question analysis','Advanced'),
('SUBJECT033','Data Security and Privacy','CLO1 Manage data privacy CLO2 Secure question bank content','Advanced'),
('SUBJECT034','Human Language Technologies','CLO1 Understand language processing CLO2 Analyze question semantics','Advanced'),
('SUBJECT035','Digital Signal Processing','CLO1 Process signals CLO2 Support audio question systems','Intermediate'),
('SUBJECT036','Text Analytics','CLO1 Extract meaning from text CLO2 Detect semantic similarity','Advanced'),
('SUBJECT037','Cloud Infrastructure Management','CLO1 Manage cloud resources CLO2 Deploy question bank software','Intermediate'),
('SUBJECT038','Data Warehousing','CLO1 Design data warehouses CLO2 Store question bank data efficiently','Intermediate'),
('SUBJECT039','Statistical Learning','CLO1 Apply statistics in learning CLO2 Model question patterns','Advanced'),
('SUBJECT040','Data Science Fundamentals','CLO1 Process data CLO2 Analyze question datasets','Intermediate'),
('SUBJECT041','Information Systems Analysis','CLO1 Analyze software requirements CLO2 Model question systems','Intermediate'),
('SUBJECT042','Digital Forensics','CLO1 Investigate digital content CLO2 Detect question tampering','Advanced'),
('SUBJECT043','Big Data Technologies','CLO1 Handle big data CLO2 Analyze large question banks','Advanced'),
('SUBJECT044','Educational Data Mining','CLO1 Extract knowledge from education data CLO2 Analyze question quality','Advanced'),
('SUBJECT045','Speech and Language Processing','CLO1 Process speech and text CLO2 Analyze spoken questions','Advanced'),
('SUBJECT046','Text Classification','CLO1 Categorize text data CLO2 Organize question banks','Advanced'),
('SUBJECT047','Software Design Patterns','CLO1 Apply design patterns CLO2 Improve question bank software design','Intermediate'),
('SUBJECT048','Natural Language Understanding','CLO1 Comprehend text meaning CLO2 Detect semantic duplicates','Advanced'),
('SUBJECT049','Data Quality Management','CLO1 Ensure data integrity CLO2 Maintain question bank accuracy','Intermediate'),
('SUBJECT050','Data Integration','CLO1 Combine data sources CLO2 Manage question bank merging','Intermediate'),
('SUBJECT051','Software Testing Strategies','CLO1 Develop testing plans CLO2 Identify software defects and duplications','Intermediate'),
('SUBJECT052','Advanced Machine Learning','CLO1 Design complex ML models CLO2 Enhance duplication detection algorithms','Advanced'),
('SUBJECT053','Database Administration','CLO1 Manage database systems CLO2 Optimize query performance','Intermediate'),
('SUBJECT054','Cloud Security','CLO1 Secure cloud environments CLO2 Protect question bank data','Advanced'),
('SUBJECT055','Information Retrieval Systems','CLO1 Design search systems CLO2 Efficiently retrieve question data','Intermediate'),
('SUBJECT056','Artificial Neural Networks','CLO1 Understand ANN principles CLO2 Apply to semantic analysis','Advanced'),
('SUBJECT057','Software Development Life Cycle','CLO1 Manage software projects CLO2 Ensure quality delivery','Intermediate'),
('SUBJECT058','Programming Languages','CLO1 Learn programming paradigms CLO2 Develop question bank software','Intermediate'),
('SUBJECT059','Data Privacy Laws','CLO1 Understand regulations CLO2 Ensure legal compliance for question data','Advanced'),
('SUBJECT060','Text Summarization','CLO1 Condense text data CLO2 Aid in question content analysis','Advanced'),
('SUBJECT061','Speech Synthesis','CLO1 Generate speech CLO2 Support question narration','Intermediate'),
('SUBJECT062','Semantic Analysis Techniques','CLO1 Analyze meaning CLO2 Detect duplicated content','Advanced'),
('SUBJECT063','Big Data Processing Frameworks','CLO1 Use frameworks CLO2 Handle large question banks','Advanced'),
('SUBJECT064','Information Theory','CLO1 Understand data encoding CLO2 Optimize question storage','Intermediate'),
('SUBJECT065','Human Factors in Computing','CLO1 Study user behavior CLO2 Improve question bank interfaces','Intermediate'),
('SUBJECT066','Educational Assessment Methods','CLO1 Develop assessment strategies CLO2 Improve exam quality','Intermediate'),
('SUBJECT067','Computer Graphics','CLO1 Create graphics CLO2 Support visual question content','Intermediate'),
('SUBJECT068','Programming for AI','CLO1 Develop AI software CLO2 Implement duplication detection','Advanced'),
('SUBJECT069','Software Maintenance','CLO1 Manage updates CLO2 Ensure question bank reliability','Intermediate'),
('SUBJECT070','Language Modeling','CLO1 Predict text CLO2 Enhance semantic detection','Advanced'),
('SUBJECT071','Data Engineering','CLO1 Build data pipelines CLO2 Prepare question data','Intermediate'),
('SUBJECT072','Text Generation','CLO1 Create text CLO2 Generate questions automatically','Advanced'),
('SUBJECT073','Distributed Systems','CLO1 Design distributed apps CLO2 Support scalable question banks','Intermediate'),
('SUBJECT074','Data Encryption','CLO1 Secure data CLO2 Protect question bank confidentiality','Advanced'),
('SUBJECT075','Computational Linguistics','CLO1 Study language computationally CLO2 Improve question analysis','Advanced'),
('SUBJECT076','Automated Grading Systems','CLO1 Develop grading software CLO2 Evaluate question effectiveness','Intermediate'),
('SUBJECT077','Data Cleaning Techniques','CLO1 Remove errors CLO2 Maintain question bank quality','Intermediate'),
('SUBJECT078','Speech Signal Processing','CLO1 Process speech CLO2 Analyze spoken questions','Advanced'),
('SUBJECT079','Knowledge Discovery in Databases','CLO1 Extract patterns CLO2 Identify duplicated questions','Advanced'),
('SUBJECT080','Software Quality Metrics','CLO1 Measure software quality CLO2 Improve question bank software','Intermediate'),
('SUBJECT081','Cloud Application Development','CLO1 Build cloud apps CLO2 Deploy question bank solutions','Intermediate'),
('SUBJECT082','Reinforcement Learning','CLO1 Learn from interaction CLO2 Improve duplication detection','Advanced'),
('SUBJECT083','Data Visualization Tools','CLO1 Use visualization CLO2 Present question statistics','Intermediate'),
('SUBJECT084','Computer Ethics','CLO1 Understand ethical issues CLO2 Manage question data responsibly','Intermediate'),
('SUBJECT085','Programming for Data Science','CLO1 Write data scripts CLO2 Analyze question datasets','Intermediate'),
('SUBJECT086','Information Systems Security','CLO1 Protect systems CLO2 Secure question banks','Advanced'),
('SUBJECT087','Digital Learning Environments','CLO1 Develop learning software CLO2 Support question usage','Intermediate'),
('SUBJECT088','Software Requirements Engineering','CLO1 Gather requirements CLO2 Define question bank features','Intermediate'),
('SUBJECT089','Text Data Mining','CLO1 Extract information CLO2 Detect question similarities','Advanced'),
('SUBJECT090','Cloud Storage Solutions','CLO1 Manage storage CLO2 Store question data securely','Intermediate'),
('SUBJECT091','Language Resources and Tools','CLO1 Use language data CLO2 Support question analysis','Advanced'),
('SUBJECT092','Educational Software Design','CLO1 Design education apps CLO2 Develop question bank software','Intermediate'),
('SUBJECT093','Advanced Database Concepts','CLO1 Learn complex DB topics CLO2 Optimize question storage','Advanced'),
('SUBJECT094','Computer Architecture','CLO1 Understand hardware CLO2 Support software efficiency','Intermediate'),
('SUBJECT095','Machine Translation','CLO1 Translate text CLO2 Assist question language processing','Advanced'),
('SUBJECT096','User Experience Design','CLO1 Design interfaces CLO2 Improve question bank usability','Intermediate'),
('SUBJECT097','Data Science Project Management','CLO1 Manage projects CLO2 Deliver question analysis solutions','Intermediate'),
('SUBJECT098','Information Visualization','CLO1 Visualize data CLO2 Present question analytics','Intermediate'),
('SUBJECT099','Programming for Natural Language Processing','CLO1 Code NLP apps CLO2 Implement question duplication detection','Advanced'),
('SUBJECT100','AI Ethics and Social Implications','CLO1 Understand AI ethics CLO2 Manage question bank responsibly','Intermediate');
Go

INSERT INTO Subject (SubjectID, SubjectName, CLOs, DifficultyLevel) VALUES
('SUBJECT101', 'Advanced Database Design', 'CLO1 Create complex schemas CLO2 Optimize queries', 'Advanced'),
('SUBJECT102', 'Big Data Analytics', 'CLO1 Process large datasets CLO2 Use analytics tools', 'Advanced'),
('SUBJECT103', 'Cloud Security', 'CLO1 Implement cloud protections CLO2 Manage identity access', 'Advanced'),
('SUBJECT104', 'Computer Graphics', 'CLO1 Render images CLO2 Use graphics APIs', 'Intermediate'),
('SUBJECT105', 'Cryptography', 'CLO1 Understand encryption CLO2 Apply security protocols', 'Advanced'),
('SUBJECT106', 'Data Visualization', 'CLO1 Create visual data CLO2 Interpret charts', 'Intermediate'),
('SUBJECT107', 'Deep Learning', 'CLO1 Design neural networks CLO2 Train deep models', 'Advanced'),
('SUBJECT108', 'Digital Forensics', 'CLO1 Investigate breaches CLO2 Collect evidence', 'Advanced'),
('SUBJECT109', 'Embedded Systems', 'CLO1 Program hardware CLO2 Optimize performance', 'Intermediate'),
('SUBJECT110', 'Game Development', 'CLO1 Build games CLO2 Use engines', 'Intermediate'),
('SUBJECT111', 'Graph Theory', 'CLO1 Analyze graphs CLO2 Solve problems', 'Advanced'),
('SUBJECT112', 'High Performance Computing', 'CLO1 Utilize parallelism CLO2 Optimize algorithms', 'Advanced'),
('SUBJECT113', 'Information Retrieval', 'CLO1 Index data CLO2 Search efficiently', 'Intermediate'),
('SUBJECT114', 'Internet of Things', 'CLO1 Connect devices CLO2 Manage sensors', 'Intermediate'),
('SUBJECT115', 'IT Project Management', 'CLO1 Plan projects CLO2 Manage teams', 'Intermediate'),
('SUBJECT116', 'Java Programming', 'CLO1 Write Java code CLO2 Use libraries', 'Beginner'),
('SUBJECT117', 'Linux Administration', 'CLO1 Manage systems CLO2 Configure servers', 'Intermediate'),
('SUBJECT118', 'Mobile Security', 'CLO1 Secure apps CLO2 Protect data', 'Advanced'),
('SUBJECT119', 'Natural Language Understanding', 'CLO1 Analyze semantics CLO2 Build language models', 'Advanced'),
('SUBJECT120', 'Network Programming', 'CLO1 Develop network apps CLO2 Handle protocols', 'Intermediate'),
('SUBJECT121', 'Object-Oriented Programming', 'CLO1 Design classes CLO2 Implement inheritance', 'Beginner'),
('SUBJECT122', 'Parallel Computing', 'CLO1 Write parallel code CLO2 Optimize tasks', 'Advanced'),
('SUBJECT123', 'Pattern Recognition', 'CLO1 Identify patterns CLO2 Apply classifiers', 'Advanced'),
('SUBJECT124', 'Python Programming', 'CLO1 Write Python scripts CLO2 Use libraries', 'Beginner'),
('SUBJECT125', 'Quantum Computing', 'CLO1 Understand qubits CLO2 Apply quantum algorithms', 'Advanced'),
('SUBJECT126', 'React Development', 'CLO1 Build UI components CLO2 Manage state', 'Intermediate'),
('SUBJECT127', 'Robotics', 'CLO1 Program robots CLO2 Control sensors', 'Advanced'),
('SUBJECT128', 'Semantic Web', 'CLO1 Use ontologies CLO2 Manage linked data', 'Advanced'),
('SUBJECT129', 'Software Testing', 'CLO1 Create test cases CLO2 Execute tests', 'Intermediate'),
('SUBJECT130', 'Software Verification', 'CLO1 Validate software CLO2 Use formal methods', 'Advanced'),
('SUBJECT131', 'Statistical Learning', 'CLO1 Apply statistical models CLO2 Analyze data', 'Advanced'),
('SUBJECT132', 'System Analysis and Design', 'CLO1 Analyze requirements CLO2 Model systems', 'Intermediate'),
('SUBJECT133', 'System Security', 'CLO1 Protect systems CLO2 Manage risks', 'Advanced'),
('SUBJECT134', 'TCP/IP Protocols', 'CLO1 Understand protocols CLO2 Implement stacks', 'Intermediate'),
('SUBJECT135', 'Theoretical Computer Science', 'CLO1 Understand algorithms CLO2 Prove concepts', 'Advanced'),
('SUBJECT136', 'User Experience Design', 'CLO1 Design interfaces CLO2 Improve usability', 'Intermediate'),
('SUBJECT137', 'Virtual Reality', 'CLO1 Create VR content CLO2 Use VR devices', 'Intermediate'),
('SUBJECT138', 'Web Security', 'CLO1 Protect websites CLO2 Prevent attacks', 'Advanced'),
('SUBJECT139', 'Wireless Networks', 'CLO1 Configure wireless CLO2 Manage connections', 'Intermediate'),
('SUBJECT140', 'XML and JSON Technologies', 'CLO1 Parse data CLO2 Use schemas', 'Beginner'),
('SUBJECT141', 'Algorithms and Complexity', 'CLO1 Analyze algorithms CLO2 Understand complexity', 'Advanced'),
('SUBJECT142', 'Augmented Reality', 'CLO1 Develop AR apps CLO2 Integrate sensors', 'Intermediate'),
('SUBJECT143', 'Blockchain Technology', 'CLO1 Understand blockchain CLO2 Build smart contracts', 'Advanced'),
('SUBJECT144', 'Business Intelligence', 'CLO1 Analyze business data CLO2 Create reports', 'Intermediate'),
('SUBJECT145', 'Cloud Infrastructure', 'CLO1 Manage cloud systems CLO2 Deploy applications', 'Intermediate'),
('SUBJECT146', 'Compiler Design', 'CLO1 Build compilers CLO2 Optimize code', 'Advanced'),
('SUBJECT147', 'Computer Architecture', 'CLO1 Understand hardware CLO2 Design processors', 'Intermediate'),
('SUBJECT148', 'Computer Vision', 'CLO1 Process images CLO2 Detect objects', 'Advanced'),
('SUBJECT149', 'Concurrency', 'CLO1 Manage threads CLO2 Synchronize processes', 'Advanced'),
('SUBJECT150', 'Data Engineering', 'CLO1 Build pipelines CLO2 Manage data flows', 'Intermediate'),
('SUBJECT151', 'Data Science', 'CLO1 Analyze data CLO2 Use tools', 'Intermediate'),
('SUBJECT152', 'Deep Neural Networks', 'CLO1 Design networks CLO2 Train models', 'Advanced'),
('SUBJECT153', 'Digital Signal Processing', 'CLO1 Process signals CLO2 Apply transforms', 'Advanced'),
('SUBJECT154', 'Embedded Software', 'CLO1 Develop firmware CLO2 Optimize code', 'Intermediate'),
('SUBJECT155', 'Enterprise Architecture', 'CLO1 Design systems CLO2 Align business', 'Advanced'),
('SUBJECT156', 'Ethical Hacking', 'CLO1 Test security CLO2 Exploit vulnerabilities', 'Advanced'),
('SUBJECT157', 'Functional Programming', 'CLO1 Write functional code CLO2 Use paradigms', 'Intermediate'),
('SUBJECT158', 'Geographic Information Systems', 'CLO1 Map data CLO2 Analyze locations', 'Intermediate'),
('SUBJECT159', 'GPU Programming', 'CLO1 Use GPUs CLO2 Optimize computations', 'Advanced'),
('SUBJECT160', 'Hardware Design', 'CLO1 Design circuits CLO2 Use HDL', 'Intermediate'),
('SUBJECT161', 'Information Theory', 'CLO1 Understand data CLO2 Apply coding', 'Advanced'),
('SUBJECT162', 'Information Visualization', 'CLO1 Create visuals CLO2 Interpret data', 'Intermediate'),
('SUBJECT163', 'Internet Security', 'CLO1 Secure networks CLO2 Use firewalls', 'Advanced'),
('SUBJECT164', 'IT Governance', 'CLO1 Manage IT CLO2 Ensure compliance', 'Intermediate'),
('SUBJECT165', 'JavaScript Programming', 'CLO1 Write JS code CLO2 Use frameworks', 'Beginner'),
('SUBJECT166', 'Knowledge Management', 'CLO1 Manage knowledge CLO2 Share information', 'Intermediate'),
('SUBJECT167', 'Logic Design', 'CLO1 Design logic circuits CLO2 Analyze systems', 'Intermediate'),
('SUBJECT168', 'Machine Vision', 'CLO1 Analyze images CLO2 Recognize patterns', 'Advanced'),
('SUBJECT169', 'Mobile Computing', 'CLO1 Develop mobile apps CLO2 Manage devices', 'Intermediate'),
('SUBJECT170', 'Multimedia Systems', 'CLO1 Process media CLO2 Manage streaming', 'Intermediate'),
('SUBJECT171', 'Network Security', 'CLO1 Protect networks CLO2 Detect intrusions', 'Advanced'),
('SUBJECT172', 'Numerical Methods', 'CLO1 Solve equations CLO2 Apply algorithms', 'Advanced'),
('SUBJECT173', 'Object Recognition', 'CLO1 Detect objects CLO2 Classify images', 'Advanced'),
('SUBJECT174', 'Operating System Concepts', 'CLO1 Understand OS CLO2 Manage resources', 'Intermediate'),
('SUBJECT175', 'Parallel Algorithms', 'CLO1 Design parallel code CLO2 Analyze performance', 'Advanced'),
('SUBJECT176', 'Pattern Matching', 'CLO1 Match patterns CLO2 Optimize searches', 'Advanced'),
('SUBJECT177', 'Predictive Analytics', 'CLO1 Build models CLO2 Forecast outcomes', 'Advanced'),
('SUBJECT178', 'Probability and Statistics', 'CLO1 Analyze data CLO2 Calculate probabilities', 'Intermediate'),
('SUBJECT179', 'Programming Languages', 'CLO1 Understand syntax CLO2 Write programs', 'Beginner'),
('SUBJECT180', 'Project Management', 'CLO1 Plan projects CLO2 Lead teams', 'Intermediate'),
('SUBJECT181', 'Python for Data Science', 'CLO1 Use Python CLO2 Analyze data', 'Beginner'),
('SUBJECT182', 'Real-Time Systems', 'CLO1 Design real-time apps CLO2 Manage timing', 'Advanced'),
('SUBJECT183', 'Reinforcement Learning', 'CLO1 Train agents CLO2 Apply algorithms', 'Advanced'),
('SUBJECT184', 'Requirements Engineering', 'CLO1 Gather requirements CLO2 Validate needs', 'Intermediate'),
('SUBJECT185', 'Robotic Process Automation', 'CLO1 Automate tasks CLO2 Use RPA tools', 'Intermediate'),
('SUBJECT186', 'Security Architecture', 'CLO1 Design security CLO2 Manage threats', 'Advanced'),
('SUBJECT187', 'Semantic Analysis', 'CLO1 Analyze meaning CLO2 Build models', 'Advanced'),
('SUBJECT188', 'Software Architecture', 'CLO1 Design software CLO2 Use patterns', 'Intermediate'),
('SUBJECT189', 'Software Development Lifecycle', 'CLO1 Manage phases CLO2 Deliver software', 'Intermediate'),
('SUBJECT190', 'Software Quality Assurance', 'CLO1 Ensure quality CLO2 Perform testing', 'Intermediate'),
('SUBJECT191', 'Spatial Databases', 'CLO1 Manage spatial data CLO2 Query GIS', 'Advanced'),
('SUBJECT192', 'SQL Programming', 'CLO1 Write SQL CLO2 Manage databases', 'Beginner'),
('SUBJECT193', 'System Integration', 'CLO1 Connect systems CLO2 Manage interfaces', 'Intermediate'),
('SUBJECT194', 'System Modeling', 'CLO1 Create models CLO2 Analyze systems', 'Intermediate'),
('SUBJECT195', 'System Programming', 'CLO1 Write system code CLO2 Manage OS', 'Advanced'),
('SUBJECT196', 'Telecommunications', 'CLO1 Understand telecom CLO2 Manage signals', 'Intermediate'),
('SUBJECT197', 'Text Mining', 'CLO1 Extract info CLO2 Analyze text', 'Advanced'),
('SUBJECT198', 'User Interface Design', 'CLO1 Design interfaces CLO2 Improve experience', 'Intermediate'),
('SUBJECT199', 'Virtualization Technologies', 'CLO1 Use VMs CLO2 Manage virtual resources', 'Intermediate'),
('SUBJECT200', 'Wireless Communications', 'CLO1 Understand wireless CLO2 Configure networks', 'Intermediate');
Go

INSERT INTO Subject (SubjectID, SubjectName, CLOs, DifficultyLevel) VALUES
('SUBJECT201','Advanced Algorithms','CLO1 Analyze algorithms CLO2 Implement solutions','Advanced'),
('SUBJECT202','Artificial Intelligence','CLO1 Build AI models CLO2 Apply AI techniques','Advanced'),
('SUBJECT203','Augmented Analytics','CLO1 Analyze data CLO2 Use AI tools','Intermediate'),
('SUBJECT204','Autonomous Systems','CLO1 Design autonomous agents CLO2 Manage systems','Advanced'),
('SUBJECT205','Blockchain Applications','CLO1 Develop blockchain apps CLO2 Manage ledgers','Advanced'),
('SUBJECT206','Business Analytics','CLO1 Analyze business data CLO2 Make decisions','Intermediate'),
('SUBJECT207','Cloud Computing Fundamentals','CLO1 Understand cloud basics CLO2 Use cloud services','Beginner'),
('SUBJECT208','Computer Ethics','CLO1 Understand ethics CLO2 Apply standards','Beginner'),
('SUBJECT209','Computer Networks','CLO1 Configure networks CLO2 Manage traffic','Intermediate'),
('SUBJECT210','Computer Security','CLO1 Protect systems CLO2 Respond to attacks','Advanced'),
('SUBJECT211','Computer Systems Engineering','CLO1 Design systems CLO2 Implement hardware','Advanced'),
('SUBJECT212','Computational Biology','CLO1 Analyze biological data CLO2 Use bioinformatics tools','Advanced'),
('SUBJECT213','Data Mining','CLO1 Extract knowledge CLO2 Analyze patterns','Intermediate'),
('SUBJECT214','Data Warehousing','CLO1 Design warehouses CLO2 Manage data','Intermediate'),
('SUBJECT215','Database Administration','CLO1 Manage DB systems CLO2 Optimize performance','Intermediate'),
('SUBJECT216','Database Security','CLO1 Secure data CLO2 Manage access','Advanced'),
('SUBJECT217','Design Patterns','CLO1 Apply patterns CLO2 Improve code quality','Intermediate'),
('SUBJECT218','Distributed Systems','CLO1 Build distributed apps CLO2 Manage concurrency','Advanced'),
('SUBJECT219','Domain-Specific Languages','CLO1 Design DSL CLO2 Implement parsers','Advanced'),
('SUBJECT220','E-commerce Systems','CLO1 Build ecommerce sites CLO2 Manage transactions','Intermediate'),
('SUBJECT221','Embedded Linux','CLO1 Use Linux on embedded CLO2 Manage devices','Advanced'),
('SUBJECT222','Enterprise Systems','CLO1 Integrate enterprise apps CLO2 Manage workflows','Intermediate'),
('SUBJECT223','Ethics in AI','CLO1 Analyze AI ethics CLO2 Apply guidelines','Intermediate'),
('SUBJECT224','Evolutionary Computing','CLO1 Implement algorithms CLO2 Solve optimization','Advanced'),
('SUBJECT225','Fault-Tolerant Systems','CLO1 Design fault tolerance CLO2 Manage errors','Advanced'),
('SUBJECT226','Fuzzy Logic','CLO1 Apply fuzzy sets CLO2 Model uncertainty','Advanced'),
('SUBJECT227','Game Theory','CLO1 Analyze strategies CLO2 Model interactions','Advanced'),
('SUBJECT228','Graph Databases','CLO1 Manage graph data CLO2 Query efficiently','Intermediate'),
('SUBJECT229','Human-Computer Interaction','CLO1 Design interactions CLO2 Evaluate usability','Intermediate'),
('SUBJECT230','Hybrid Cloud','CLO1 Manage hybrid systems CLO2 Deploy apps','Advanced'),
('SUBJECT231','Information Assurance','CLO1 Ensure information security CLO2 Manage risks','Advanced'),
('SUBJECT232','Information Systems Analysis','CLO1 Analyze info systems CLO2 Recommend improvements','Intermediate'),
('SUBJECT233','Information Systems Management','CLO1 Manage info systems CLO2 Align business goals','Intermediate'),
('SUBJECT234','Information Systems Security','CLO1 Secure info systems CLO2 Manage policies','Advanced'),
('SUBJECT235','Infrastructure as Code','CLO1 Automate infra CLO2 Use scripting','Intermediate'),
('SUBJECT236','Intelligent Agents','CLO1 Build agents CLO2 Implement AI techniques','Advanced'),
('SUBJECT237','Internet Programming','CLO1 Develop web apps CLO2 Manage protocols','Intermediate'),
('SUBJECT238','IoT Security','CLO1 Secure IoT devices CLO2 Manage threats','Advanced'),
('SUBJECT239','IT Compliance','CLO1 Ensure compliance CLO2 Audit systems','Intermediate'),
('SUBJECT240','IT Risk Management','CLO1 Identify risks CLO2 Apply controls','Advanced'),
('SUBJECT241','Java Advanced Programming','CLO1 Use advanced Java CLO2 Build complex apps','Advanced'),
('SUBJECT242','Knowledge Discovery','CLO1 Discover knowledge CLO2 Use data mining','Intermediate'),
('SUBJECT243','Machine Learning','CLO1 Build ML models CLO2 Evaluate algorithms','Advanced'),
('SUBJECT244','Mobile Application Development','CLO1 Develop mobile apps CLO2 Test applications','Intermediate'),
('SUBJECT245','Multicore Programming','CLO1 Use multicore CPUs CLO2 Optimize code','Advanced'),
('SUBJECT246','Network Architecture','CLO1 Design networks CLO2 Manage infrastructure','Intermediate'),
('SUBJECT247','Network Management','CLO1 Manage networks CLO2 Monitor traffic','Intermediate'),
('SUBJECT248','Network Protocols','CLO1 Understand protocols CLO2 Implement standards','Intermediate'),
('SUBJECT249','NoSQL Databases','CLO1 Use NoSQL CLO2 Manage data models','Intermediate'),
('SUBJECT250','Operating Systems','CLO1 Understand OS principles CLO2 Manage processes','Intermediate'),
('SUBJECT251','Parallel and Distributed Computing','CLO1 Build parallel programs CLO2 Manage distributed systems','Advanced'),
('SUBJECT252','Performance Engineering','CLO1 Optimize performance CLO2 Use profiling tools','Advanced'),
('SUBJECT253','Programming Paradigms','CLO1 Understand paradigms CLO2 Apply techniques','Intermediate'),
('SUBJECT254','Quantum Information Science','CLO1 Understand quantum info CLO2 Apply theory','Advanced'),
('SUBJECT255','Real-Time Data Processing','CLO1 Process data real-time CLO2 Use streaming tech','Advanced'),
('SUBJECT256','Requirements Analysis','CLO1 Analyze requirements CLO2 Document specs','Intermediate'),
('SUBJECT257','Risk Analysis','CLO1 Analyze risks CLO2 Mitigate issues','Advanced'),
('SUBJECT258','Robotics Programming','CLO1 Program robots CLO2 Use sensors','Advanced'),
('SUBJECT259','Security Policy','CLO1 Develop policies CLO2 Enforce security','Advanced'),
('SUBJECT260','Semantic Technologies','CLO1 Use semantic web CLO2 Manage ontologies','Advanced'),
('SUBJECT261','Service-Oriented Architecture','CLO1 Design SOA CLO2 Implement services','Intermediate'),
('SUBJECT262','Software Configuration Management','CLO1 Manage software versions CLO2 Automate builds','Intermediate'),
('SUBJECT263','Software Engineering','CLO1 Develop software CLO2 Use best practices','Intermediate'),
('SUBJECT264','Software Metrics','CLO1 Measure software CLO2 Analyze data','Intermediate'),
('SUBJECT265','Software Process Improvement','CLO1 Improve processes CLO2 Apply models','Intermediate'),
('SUBJECT266','Software Project Management','CLO1 Manage projects CLO2 Coordinate teams','Intermediate'),
('SUBJECT267','Software Requirements','CLO1 Gather requirements CLO2 Manage changes','Intermediate'),
('SUBJECT268','Software Testing and QA','CLO1 Test software CLO2 Ensure quality','Intermediate'),
('SUBJECT269','Spatial Data Analysis','CLO1 Analyze spatial data CLO2 Use GIS tools','Advanced'),
('SUBJECT270','Speech Processing','CLO1 Process speech CLO2 Use recognition tools','Advanced'),
('SUBJECT271','System Administration','CLO1 Manage systems CLO2 Configure servers','Intermediate'),
('SUBJECT272','System Design','CLO1 Design systems CLO2 Evaluate trade-offs','Intermediate'),
('SUBJECT273','System Development','CLO1 Develop systems CLO2 Test implementations','Intermediate'),
('SUBJECT274','System Performance','CLO1 Monitor performance CLO2 Optimize systems','Advanced'),
('SUBJECT275','System Security Engineering','CLO1 Engineer secure systems CLO2 Manage vulnerabilities','Advanced'),
('SUBJECT276','Text Analytics','CLO1 Analyze text CLO2 Extract insights','Advanced'),
('SUBJECT277','Theoretical Foundations of CS','CLO1 Understand theory CLO2 Apply models','Advanced'),
('SUBJECT278','Traffic Engineering','CLO1 Manage network traffic CLO2 Optimize flows','Advanced'),
('SUBJECT279','Unified Modeling Language','CLO1 Use UML CLO2 Model systems','Intermediate'),
('SUBJECT280','User-Centered Design','CLO1 Design for users CLO2 Evaluate feedback','Intermediate'),
('SUBJECT281','Virtual Machines','CLO1 Use virtualization CLO2 Manage VMs','Intermediate'),
('SUBJECT282','Web Security','CLO1 Secure web apps CLO2 Prevent attacks','Advanced'),
('SUBJECT283','Wireless Networks','CLO1 Configure wireless CLO2 Manage security','Intermediate'),
('SUBJECT284','XML Technologies','CLO1 Use XML CLO2 Manage data exchange','Intermediate'),
('SUBJECT285','Data Visualization','CLO1 Visualize data CLO2 Create dashboards','Intermediate'),
('SUBJECT286','Big Data Analytics','CLO1 Process big data CLO2 Extract insights','Advanced'),
('SUBJECT287','Cybersecurity Fundamentals','CLO1 Understand cyber risks CLO2 Implement protections','Beginner'),
('SUBJECT288','Digital Forensics','CLO1 Investigate incidents CLO2 Collect evidence','Advanced'),
('SUBJECT289','Embedded Systems','CLO1 Design embedded devices CLO2 Program microcontrollers','Advanced'),
('SUBJECT290','Human Factors Engineering','CLO1 Analyze human interaction CLO2 Improve design','Intermediate'),
('SUBJECT291','Information Retrieval','CLO1 Build search systems CLO2 Optimize queries','Intermediate'),
('SUBJECT292','Information Theory','CLO1 Understand info theory CLO2 Apply coding','Advanced'),
('SUBJECT293','IT Project Management','CLO1 Plan projects CLO2 Manage teams','Intermediate'),
('SUBJECT294','Knowledge Management','CLO1 Manage knowledge CLO2 Facilitate sharing','Intermediate'),
('SUBJECT295','Multimedia Systems','CLO1 Process multimedia CLO2 Deliver content','Intermediate'),
('SUBJECT296','Natural Language Processing','CLO1 Process language CLO2 Build NLP apps','Advanced'),
('SUBJECT297','Neural Networks','CLO1 Build neural nets CLO2 Train models','Advanced'),
('SUBJECT298','Object-Oriented Design','CLO1 Design OO systems CLO2 Use UML','Intermediate'),
('SUBJECT299','Pattern Recognition','CLO1 Recognize patterns CLO2 Apply algorithms','Advanced'),
('SUBJECT300','Privacy Engineering','CLO1 Protect data privacy CLO2 Implement controls','Advanced');
Go

INSERT INTO Subject (SubjectID, SubjectName, CLOs, DifficultyLevel) VALUES
('SUBJECT301','Distributed Systems','CLO1 Understand distributed architecture CLO2 Design distributed algorithms','Advanced'),
('SUBJECT302','Mobile Computing','CLO1 Develop mobile applications CLO2 Optimize mobile networks','Intermediate'),
('SUBJECT303','Cloud Computing','CLO1 Deploy cloud services CLO2 Manage virtual resources','Advanced'),
('SUBJECT304','Data Mining','CLO1 Extract patterns from data CLO2 Apply clustering algorithms','Intermediate'),
('SUBJECT305','Big Data Analytics','CLO1 Handle big datasets CLO2 Use Hadoop and Spark','Advanced'),
('SUBJECT306','Natural Language Processing','CLO1 Process text data CLO2 Build language models','Advanced'),
('SUBJECT307','Computer Vision','CLO1 Analyze images CLO2 Implement recognition systems','Advanced'),
('SUBJECT308','Cybersecurity','CLO1 Protect systems CLO2 Detect intrusions','Intermediate'),
('SUBJECT309','Software Testing','CLO1 Design test cases CLO2 Automate testing','Intermediate'),
('SUBJECT310','Software Engineering','CLO1 Apply software development lifecycle CLO2 Manage projects','Intermediate'),
('SUBJECT311','Human-Computer Interaction','CLO1 Design interfaces CLO2 Evaluate usability','Intermediate'),
('SUBJECT312','Robotics','CLO1 Program robots CLO2 Implement sensors','Advanced'),
('SUBJECT313','Artificial Intelligence','CLO1 Build AI models CLO2 Use machine learning','Advanced'),
('SUBJECT314','Machine Learning','CLO1 Train algorithms CLO2 Evaluate models','Advanced'),
('SUBJECT315','Data Structures','CLO1 Implement data structures CLO2 Analyze algorithms','Basic'),
('SUBJECT316','Algorithms','CLO1 Design algorithms CLO2 Prove correctness','Basic'),
('SUBJECT317','Operating Systems','CLO1 Manage processes CLO2 Handle memory','Intermediate'),
('SUBJECT318','Computer Networks','CLO1 Understand protocols CLO2 Configure networks','Intermediate'),
('SUBJECT319','Database Systems','CLO1 Design databases CLO2 Write SQL queries','Intermediate'),
('SUBJECT320','Web Development','CLO1 Build web apps CLO2 Use frontend and backend','Intermediate'),
('SUBJECT321','Embedded Systems','CLO1 Develop embedded software CLO2 Manage hardware resources','Advanced'),
('SUBJECT322','Parallel Computing','CLO1 Implement parallel algorithms CLO2 Optimize performance','Advanced'),
('SUBJECT323','Compiler Design','CLO1 Build compilers CLO2 Optimize code generation','Advanced'),
('SUBJECT324','Information Retrieval','CLO1 Implement search engines CLO2 Rank results','Intermediate'),
('SUBJECT325','Cryptography','CLO1 Understand encryption CLO2 Apply cryptographic protocols','Advanced'),
('SUBJECT326','Cloud Security','CLO1 Secure cloud infrastructure CLO2 Manage access control','Advanced'),
('SUBJECT327','Blockchain Technology','CLO1 Understand blockchain CLO2 Develop smart contracts','Advanced'),
('SUBJECT328','Data Visualization','CLO1 Create charts CLO2 Interpret data visually','Intermediate'),
('SUBJECT329','Internet of Things','CLO1 Connect IoT devices CLO2 Manage IoT data','Intermediate'),
('SUBJECT330','Software Architecture','CLO1 Design software systems CLO2 Document architecture','Advanced'),
('SUBJECT331','Quality Assurance','CLO1 Ensure software quality CLO2 Conduct audits','Intermediate'),
('SUBJECT332','Project Management','CLO1 Plan projects CLO2 Manage teams','Intermediate'),
('SUBJECT333','Ethical Hacking','CLO1 Conduct penetration tests CLO2 Report vulnerabilities','Advanced'),
('SUBJECT334','Augmented Reality','CLO1 Develop AR apps CLO2 Integrate sensors','Advanced'),
('SUBJECT335','Virtual Reality','CLO1 Build VR environments CLO2 Manage 3D rendering','Advanced'),
('SUBJECT336','Digital Signal Processing','CLO1 Process signals CLO2 Implement filters','Advanced'),
('SUBJECT337','Wireless Communications','CLO1 Understand wireless protocols CLO2 Design wireless networks','Intermediate'),
('SUBJECT338','Computer Graphics','CLO1 Render graphics CLO2 Use OpenGL','Intermediate'),
('SUBJECT339','Information Systems','CLO1 Analyze systems CLO2 Manage information flow','Intermediate'),
('SUBJECT340','Bioinformatics','CLO1 Analyze biological data CLO2 Use computational tools','Advanced'),
('SUBJECT341','Software Maintenance','CLO1 Update software CLO2 Manage version control','Intermediate'),
('SUBJECT342','E-commerce Systems','CLO1 Design e-commerce platforms CLO2 Manage transactions','Intermediate'),
('SUBJECT343','Game Development','CLO1 Develop games CLO2 Use game engines','Intermediate'),
('SUBJECT344','Data Warehousing','CLO1 Design data warehouses CLO2 Perform ETL processes','Advanced'),
('SUBJECT345','Information Theory','CLO1 Understand information metrics CLO2 Apply coding theory','Advanced'),
('SUBJECT346','Telecommunications','CLO1 Understand telecom networks CLO2 Manage signal transmission','Intermediate'),
('SUBJECT347','Software Metrics','CLO1 Measure software quality CLO2 Analyze metrics','Intermediate'),
('SUBJECT348','Distributed Databases','CLO1 Design distributed databases CLO2 Manage data consistency','Advanced'),
('SUBJECT349','Knowledge Management','CLO1 Organize knowledge CLO2 Apply KM tools','Intermediate'),
('SUBJECT350','Cloud Infrastructure','CLO1 Manage cloud resources CLO2 Optimize infrastructure','Advanced'),
('SUBJECT351','Mobile Security','CLO1 Secure mobile devices CLO2 Implement authentication','Intermediate'),
('SUBJECT352','Computer Forensics','CLO1 Investigate cyber crimes CLO2 Recover digital evidence','Advanced'),
('SUBJECT353','Data Privacy','CLO1 Understand privacy laws CLO2 Apply privacy techniques','Intermediate'),
('SUBJECT354','Human-Robot Interaction','CLO1 Design interaction systems CLO2 Evaluate usability','Advanced'),
('SUBJECT355','Semantic Web','CLO1 Understand semantic technologies CLO2 Build ontologies','Advanced'),
('SUBJECT356','Cloud Native Applications','CLO1 Develop cloud-native apps CLO2 Use containerization','Advanced'),
('SUBJECT357','Edge Computing','CLO1 Deploy edge solutions CLO2 Manage data at edge','Advanced'),
('SUBJECT358','Computer Architecture','CLO1 Understand hardware design CLO2 Optimize system performance','Intermediate'),
('SUBJECT359','Software Documentation','CLO1 Write documentation CLO2 Maintain records','Intermediate'),
('SUBJECT360','IT Governance','CLO1 Implement IT policies CLO2 Ensure compliance','Intermediate'),
('SUBJECT361','IT Service Management','CLO1 Manage IT services CLO2 Use ITIL frameworks','Intermediate'),
('SUBJECT362','Data Engineering','CLO1 Build data pipelines CLO2 Manage big data','Advanced'),
('SUBJECT363','Digital Marketing','CLO1 Use marketing tools CLO2 Analyze campaigns','Intermediate'),
('SUBJECT364','Software Configuration Management','CLO1 Manage versions CLO2 Control changes','Intermediate'),
('SUBJECT365','Machine Vision','CLO1 Process visual data CLO2 Implement recognition','Advanced'),
('SUBJECT366','Data Governance','CLO1 Ensure data quality CLO2 Implement policies','Intermediate'),
('SUBJECT367','Social Network Analysis','CLO1 Analyze social graphs CLO2 Interpret relationships','Intermediate'),
('SUBJECT368','Cloud Automation','CLO1 Automate cloud tasks CLO2 Use scripting tools','Advanced'),
('SUBJECT369','Mobile Application Security','CLO1 Secure mobile apps CLO2 Manage vulnerabilities','Advanced'),
('SUBJECT370','Quantum Computing','CLO1 Understand quantum algorithms CLO2 Apply quantum models','Advanced'),
('SUBJECT371','Information Visualization','CLO1 Design visual representations CLO2 Interpret data','Intermediate'),
('SUBJECT372','Software Product Management','CLO1 Manage product lifecycle CLO2 Coordinate teams','Intermediate'),
('SUBJECT373','Data Quality Management','CLO1 Assess data quality CLO2 Implement improvements','Intermediate'),
('SUBJECT374','Cloud Storage','CLO1 Manage cloud storage CLO2 Optimize performance','Intermediate'),
('SUBJECT375','Internet Security','CLO1 Protect internet systems CLO2 Detect threats','Intermediate'),
('SUBJECT376','Computer Ethics','CLO1 Understand ethical issues CLO2 Apply ethical standards','Basic'),
('SUBJECT377','IT Risk Management','CLO1 Identify IT risks CLO2 Mitigate risks','Intermediate'),
('SUBJECT378','Cyber Law','CLO1 Understand cyber regulations CLO2 Apply legal frameworks','Intermediate'),
('SUBJECT379','Database Administration','CLO1 Manage databases CLO2 Optimize queries','Intermediate'),
('SUBJECT380','Cloud Migration','CLO1 Plan migration CLO2 Execute cloud transfer','Advanced'),
('SUBJECT381','DevOps','CLO1 Automate deployments CLO2 Manage CI/CD pipelines','Advanced'),
('SUBJECT382','Information Security Management','CLO1 Implement ISMS CLO2 Ensure compliance','Advanced'),
('SUBJECT383','AI Ethics','CLO1 Understand AI ethical issues CLO2 Apply ethical guidelines','Intermediate'),
('SUBJECT384','IT Architecture','CLO1 Design IT infrastructure CLO2 Align IT with business','Intermediate'),
('SUBJECT385','Service-Oriented Architecture','CLO1 Design SOA systems CLO2 Implement services','Advanced'),
('SUBJECT386','Cloud Networking','CLO1 Configure cloud networks CLO2 Manage connectivity','Advanced'),
('SUBJECT387','Software Performance Engineering','CLO1 Analyze performance CLO2 Optimize software','Advanced'),
('SUBJECT388','Data Science','CLO1 Analyze data CLO2 Build predictive models','Advanced'),
('SUBJECT389','Big Data Technologies','CLO1 Use big data tools CLO2 Manage data flows','Advanced'),
('SUBJECT390','Mobile User Experience','CLO1 Design mobile UX CLO2 Test usability','Intermediate'),
('SUBJECT391','IT Compliance','CLO1 Ensure regulatory compliance CLO2 Manage audits','Intermediate'),
('SUBJECT392','Software Development Methodologies','CLO1 Apply SDLC CLO2 Manage agile projects','Intermediate'),
('SUBJECT393','Business Intelligence','CLO1 Analyze business data CLO2 Generate reports','Intermediate'),
('SUBJECT394','Information Retrieval Systems','CLO1 Build IR systems CLO2 Evaluate effectiveness','Intermediate'),
('SUBJECT395','Digital Forensics','CLO1 Investigate digital crimes CLO2 Recover data','Advanced'),
('SUBJECT396','Data Integration','CLO1 Integrate data sources CLO2 Manage ETL','Intermediate'),
('SUBJECT397','Cloud Analytics','CLO1 Analyze cloud data CLO2 Use analytics tools','Advanced'),
('SUBJECT398','IT Infrastructure Management','CLO1 Manage IT assets CLO2 Optimize resources','Intermediate'),
('SUBJECT399','AI Programming','CLO1 Write AI code CLO2 Use AI frameworks','Advanced'),
('SUBJECT400','Information Visualization Techniques','CLO1 Design visualizations CLO2 Interpret complex data','Intermediate');
Go

INSERT INTO Subject (SubjectID, SubjectName, CLOs, DifficultyLevel) VALUES
('SUBJECT401','Advanced Database Systems','CLO1 Design advanced DB CLO2 Optimize queries','Advanced'),
('SUBJECT402','Cloud Data Management','CLO1 Manage cloud data CLO2 Implement security','Advanced'),
('SUBJECT403','Data Ethics','CLO1 Understand ethical data use CLO2 Apply compliance','Intermediate'),
('SUBJECT404','AI in Healthcare','CLO1 Apply AI in medical field CLO2 Analyze healthcare data','Advanced'),
('SUBJECT405','Mobile Cloud Computing','CLO1 Develop mobile cloud apps CLO2 Optimize performance','Advanced'),
('SUBJECT406','Internet Protocols','CLO1 Understand IP standards CLO2 Configure networks','Intermediate'),
('SUBJECT407','Software Reliability','CLO1 Ensure software reliability CLO2 Perform risk analysis','Intermediate'),
('SUBJECT408','Augmented Analytics','CLO1 Use AI for analytics CLO2 Interpret results','Advanced'),
('SUBJECT409','Edge AI','CLO1 Deploy AI on edge devices CLO2 Optimize inference','Advanced'),
('SUBJECT410','Quantum Information','CLO1 Understand quantum info CLO2 Apply quantum cryptography','Advanced'),
('SUBJECT411','Cyber Physical Systems','CLO1 Integrate cyber and physical CLO2 Design secure systems','Advanced'),
('SUBJECT412','AI for Robotics','CLO1 Build AI robots CLO2 Implement navigation','Advanced'),
('SUBJECT413','Cloud Service Models','CLO1 Understand SaaS,PaaS,IaaS CLO2 Manage services','Intermediate'),
('SUBJECT414','AI Algorithms','CLO1 Develop AI algorithms CLO2 Evaluate performance','Advanced'),
('SUBJECT415','Data Governance Frameworks','CLO1 Implement governance CLO2 Manage data quality','Intermediate'),
('SUBJECT416','Mobile UI Design','CLO1 Design mobile UI CLO2 Test usability','Intermediate'),
('SUBJECT417','Secure Software Development','CLO1 Develop secure code CLO2 Perform vulnerability tests','Advanced'),
('SUBJECT418','Data Compression','CLO1 Apply compression CLO2 Optimize storage','Intermediate'),
('SUBJECT419','Cloud Platform Engineering','CLO1 Engineer cloud platforms CLO2 Automate infrastructure','Advanced'),
('SUBJECT420','Human Factors in Computing','CLO1 Study user behavior CLO2 Improve interfaces','Intermediate'),
('SUBJECT421','Advanced Networking','CLO1 Configure advanced networks CLO2 Manage routing','Advanced'),
('SUBJECT422','AI Ethics and Society','CLO1 Analyze AI impact CLO2 Apply ethical principles','Intermediate'),
('SUBJECT423','Natural Language Generation','CLO1 Generate text CLO2 Build conversational systems','Advanced'),
('SUBJECT424','Blockchain Development','CLO1 Develop blockchain apps CLO2 Manage ledgers','Advanced'),
('SUBJECT425','Cloud Orchestration','CLO1 Orchestrate cloud services CLO2 Use automation tools','Advanced'),
('SUBJECT426','Data Lakes','CLO1 Design data lakes CLO2 Manage storage','Intermediate'),
('SUBJECT427','Mobile App Testing','CLO1 Test mobile apps CLO2 Automate tests','Intermediate'),
('SUBJECT428','AI in Finance','CLO1 Apply AI to finance CLO2 Model financial data','Advanced'),
('SUBJECT429','Data Security','CLO1 Protect data CLO2 Implement encryption','Intermediate'),
('SUBJECT430','Software Design Patterns','CLO1 Apply design patterns CLO2 Improve code structure','Intermediate'),
('SUBJECT431','Cloud Cost Management','CLO1 Optimize cloud costs CLO2 Monitor usage','Intermediate'),
('SUBJECT432','Speech Recognition','CLO1 Implement speech systems CLO2 Process audio data','Advanced'),
('SUBJECT433','AI in Education','CLO1 Develop AI educational tools CLO2 Analyze learning data','Advanced'),
('SUBJECT434','Distributed Ledger Technologies','CLO1 Understand DLT CLO2 Build decentralized apps','Advanced'),
('SUBJECT435','Cloud Security Architecture','CLO1 Design secure cloud CLO2 Implement policies','Advanced'),
('SUBJECT436','AI and Machine Ethics','CLO1 Study AI ethics CLO2 Apply ethical AI','Intermediate'),
('SUBJECT437','Mobile Network Security','CLO1 Secure mobile networks CLO2 Manage threats','Intermediate'),
('SUBJECT438','Data Analytics Tools','CLO1 Use analytics tools CLO2 Visualize data','Intermediate'),
('SUBJECT439','Robotic Process Automation','CLO1 Develop RPA bots CLO2 Automate tasks','Intermediate'),
('SUBJECT440','Cybersecurity Risk Assessment','CLO1 Assess risks CLO2 Manage mitigation','Intermediate'),
('SUBJECT441','Cloud Computing Platforms','CLO1 Use cloud platforms CLO2 Deploy applications','Intermediate'),
('SUBJECT442','AI for Image Processing','CLO1 Process images CLO2 Apply AI techniques','Advanced'),
('SUBJECT443','Cloud Backup Solutions','CLO1 Implement backups CLO2 Manage data recovery','Intermediate'),
('SUBJECT444','IT Audit','CLO1 Perform IT audits CLO2 Ensure compliance','Intermediate'),
('SUBJECT445','Advanced Machine Learning','CLO1 Build complex ML models CLO2 Evaluate results','Advanced'),
('SUBJECT446','Mobile Security Protocols','CLO1 Implement protocols CLO2 Secure communications','Intermediate'),
('SUBJECT447','Cloud Networking Security','CLO1 Secure cloud networks CLO2 Manage firewalls','Advanced'),
('SUBJECT448','AI Model Deployment','CLO1 Deploy AI models CLO2 Monitor performance','Advanced'),
('SUBJECT449','Data Ethics and Privacy','CLO1 Understand data ethics CLO2 Apply privacy laws','Intermediate'),
('SUBJECT450','Mobile Application Development','CLO1 Build mobile apps CLO2 Optimize UX','Intermediate'),
('SUBJECT451','Cloud Resource Management','CLO1 Manage cloud resources CLO2 Optimize usage','Intermediate'),
('SUBJECT452','AI for Natural Language Understanding','CLO1 Understand language CLO2 Build NLU models','Advanced'),
('SUBJECT453','Cloud Automation Tools','CLO1 Use automation CLO2 Manage infrastructure','Advanced'),
('SUBJECT454','Cybersecurity Technologies','CLO1 Use security tech CLO2 Manage defenses','Intermediate'),
('SUBJECT455','Mobile Data Management','CLO1 Manage mobile data CLO2 Optimize storage','Intermediate'),
('SUBJECT456','AI in Manufacturing','CLO1 Apply AI CLO2 Optimize production','Advanced'),
('SUBJECT457','Cloud Service Security','CLO1 Secure services CLO2 Manage access','Advanced'),
('SUBJECT458','Data Mining Techniques','CLO1 Apply mining CLO2 Analyze results','Intermediate'),
('SUBJECT459','Mobile Cloud Integration','CLO1 Integrate mobile and cloud CLO2 Manage synchronization','Advanced'),
('SUBJECT460','AI for Predictive Analytics','CLO1 Build predictive models CLO2 Analyze data','Advanced'),
('SUBJECT461','Cloud Performance Optimization','CLO1 Optimize cloud CLO2 Monitor services','Advanced'),
('SUBJECT462','Data Science Tools','CLO1 Use data tools CLO2 Analyze datasets','Intermediate'),
('SUBJECT463','Mobile User Interface Design','CLO1 Design UI CLO2 Improve usability','Intermediate'),
('SUBJECT464','AI in Cybersecurity','CLO1 Use AI CLO2 Detect threats','Advanced'),
('SUBJECT465','Cloud Infrastructure Security','CLO1 Secure infrastructure CLO2 Manage policies','Advanced'),
('SUBJECT466','Data Analytics Methods','CLO1 Apply analytics CLO2 Interpret data','Intermediate'),
('SUBJECT467','Mobile Application Security Testing','CLO1 Test security CLO2 Detect vulnerabilities','Advanced'),
('SUBJECT468','AI for Autonomous Systems','CLO1 Build autonomous systems CLO2 Implement AI','Advanced'),
('SUBJECT469','Cloud Network Management','CLO1 Manage cloud networks CLO2 Ensure connectivity','Intermediate'),
('SUBJECT470','Data Visualization Tools','CLO1 Use visualization tools CLO2 Present data','Intermediate'),
('SUBJECT471','Mobile Computing Architectures','CLO1 Design architectures CLO2 Optimize mobile apps','Advanced'),
('SUBJECT472','AI for Social Media','CLO1 Analyze social data CLO2 Build AI tools','Advanced'),
('SUBJECT473','Cloud Application Development','CLO1 Develop cloud apps CLO2 Deploy services','Intermediate'),
('SUBJECT474','Data Security Policies','CLO1 Develop policies CLO2 Ensure compliance','Intermediate'),
('SUBJECT475','Mobile Application Frameworks','CLO1 Use frameworks CLO2 Build apps','Intermediate'),
('SUBJECT476','AI for Healthcare Analytics','CLO1 Analyze healthcare data CLO2 Build AI models','Advanced'),
('SUBJECT477','Cloud Database Management','CLO1 Manage cloud DB CLO2 Optimize queries','Advanced'),
('SUBJECT478','Data Quality Assessment','CLO1 Assess quality CLO2 Implement standards','Intermediate'),
('SUBJECT479','Mobile Cloud Security','CLO1 Secure mobile cloud CLO2 Manage access','Advanced'),
('SUBJECT480','AI for Financial Analytics','CLO1 Analyze finance CLO2 Build predictive models','Advanced'),
('SUBJECT481','Cloud Infrastructure Management','CLO1 Manage infrastructure CLO2 Optimize resources','Intermediate'),
('SUBJECT482','Data Ethics and Compliance','CLO1 Understand ethics CLO2 Ensure compliance','Intermediate'),
('SUBJECT483','Mobile Application Performance','CLO1 Optimize performance CLO2 Analyze usage','Intermediate'),
('SUBJECT484','AI for Image Recognition','CLO1 Build recognition systems CLO2 Use AI techniques','Advanced'),
('SUBJECT485','Cloud Migration Strategies','CLO1 Plan migration CLO2 Execute transfers','Advanced'),
('SUBJECT486','Data Analytics Frameworks','CLO1 Use frameworks CLO2 Analyze data','Intermediate'),
('SUBJECT487','Mobile Security Threats','CLO1 Identify threats CLO2 Implement protections','Intermediate'),
('SUBJECT488','AI for Text Analytics','CLO1 Analyze text CLO2 Build AI models','Advanced'),
('SUBJECT489','Cloud Cost Optimization','CLO1 Optimize costs CLO2 Monitor spending','Intermediate'),
('SUBJECT490','Data Privacy Laws','CLO1 Understand laws CLO2 Apply policies','Intermediate'),
('SUBJECT491','Mobile Cloud Technologies','CLO1 Use mobile cloud CLO2 Develop applications','Advanced'),
('SUBJECT492','AI for Speech Recognition','CLO1 Build speech models CLO2 Process audio','Advanced'),
('SUBJECT493','Cloud Backup Strategies','CLO1 Plan backups CLO2 Manage recovery','Intermediate'),
('SUBJECT494','Data Governance Standards','CLO1 Implement standards CLO2 Manage compliance','Intermediate'),
('SUBJECT495','Mobile App User Experience','CLO1 Design UX CLO2 Test applications','Intermediate'),
('SUBJECT496','AI for Robotics Control','CLO1 Control robots CLO2 Implement AI algorithms','Advanced'),
('SUBJECT497','Cloud Service Integration','CLO1 Integrate services CLO2 Manage APIs','Intermediate'),
('SUBJECT498','Data Encryption Techniques','CLO1 Apply encryption CLO2 Ensure data security','Intermediate'),
('SUBJECT499','Mobile Device Management','CLO1 Manage devices CLO2 Implement policies','Intermediate'),
('SUBJECT500','AI for Autonomous Vehicles','CLO1 Develop autonomous vehicles CLO2 Apply AI systems','Advanced');
Go



INSERT INTO Question (SubjectID, QuestionText, DifficultyLevel, IsDuplicate, CreatedBy, CreatedDate) VALUES
('SUBJECT001', 'What is the main theme of the passage?', 'Medium', 0, 1, '2024-04-01'),
('SUBJECT002', 'Which detail best supports the theme?', 'Hard', 0, 2, '2024-04-02'),
('SUBJECT003', 'How does the setting affect the plot development?', 'Medium', 0, 3, '2024-04-03'),
('SUBJECT004', 'What is the meaning of the phrase under the gun?', 'Easy', 0, 4, '2024-04-04'),
('SUBJECT005', 'How does the author create suspense?', 'Medium', 0, 5, '2024-04-05'),
('SUBJECT006', 'Which event is the turning point of the story?', 'Hard', 0, 6, '2024-04-06'),
('SUBJECT007', 'What does the phrase spill the beans mean?', 'Easy', 0, 7, '2024-04-07'),
('SUBJECT008', 'How does the author use imagery to evoke emotion?', 'Medium', 0, 8, '2024-04-08'),
('SUBJECT009', 'What is the central conflict in the passage?', 'Hard', 0, 9, '2024-04-09'),
('SUBJECT010', 'How does the author develop the protagonist?', 'Medium', 0, 10, '2024-04-10'),
('SUBJECT011', 'What is the significance of the recurring image?', 'Hard', 0, 11, '2024-04-11'),
('SUBJECT012', 'How does the author develop the setting?', 'Medium', 0, 12, '2024-04-12'),
('SUBJECT013', 'What is the tone of the narrator in the story?', 'Easy', 0, 13, '2024-04-13'),
('SUBJECT014', 'How does the dialogue reveal character traits?', 'Medium', 0, 14, '2024-04-14'),
('SUBJECT015', 'What is the role of the protagonist in the story?', 'Medium', 0, 15, '2024-04-15'),
('SUBJECT016', 'How does the author use flashbacks?', 'Medium', 0, 16, '2024-04-16'),
('SUBJECT017', 'What does the phrase cold shoulder mean in context?', 'Easy', 0, 17, '2024-04-17'),
('SUBJECT018', 'Which character is the antagonist?', 'Medium', 0, 18, '2024-04-18'),
('SUBJECT019', 'How does the author develop the plot?', 'Hard', 0, 19, '2024-04-19'),
('SUBJECT020', 'What is the narrator’s perspective?', 'Medium', 0, 20, '2024-04-20'),
('SUBJECT021', 'How is symbolism used in the passage?', 'Medium', 0, 21, '2024-04-21'),
('SUBJECT022', 'What mood does the author create?', 'Easy', 0, 22, '2024-04-22'),
('SUBJECT023', 'How does the setting influence the characters?', 'Medium', 0, 23, '2024-04-23'),
('SUBJECT024', 'What is the significance of the title?', 'Hard', 0, 24, '2024-04-24'),
('SUBJECT025', 'How does the author structure the text?', 'Medium', 0, 25, '2024-04-25'),
('SUBJECT026', 'What is the effect of the imagery?', 'Medium', 0, 26, '2024-04-26'),
('SUBJECT027', 'How do characters change throughout the story?', 'Hard', 0, 27, '2024-04-27'),
('SUBJECT028', 'What is the author’s tone?', 'Easy', 0, 28, '2024-04-28'),
('SUBJECT029', 'How does the dialogue advance the plot?', 'Medium', 0, 29, '2024-04-29'),
('SUBJECT030', 'What is the central theme?', 'Medium', 0, 30, '2024-04-30'),
('SUBJECT031', 'What is the author’s purpose in the passage?', 'Medium', 0, 31, '2024-05-01'),
('SUBJECT032', 'How does the setting reflect the mood?', 'Medium', 0, 32, '2024-05-02'),
('SUBJECT033', 'What is the significance of the first paragraph?', 'Hard', 0, 33, '2024-05-03'),
('SUBJECT034', 'How do characters respond to conflict?', 'Medium', 0, 34, '2024-05-04'),
('SUBJECT035', 'What is the tone of the passage?', 'Easy', 0, 35, '2024-05-05'),
('SUBJECT036', 'How does the author develop the antagonist?', 'Hard', 0, 36, '2024-05-06'),
('SUBJECT037', 'What is the effect of foreshadowing?', 'Medium', 0, 37, '2024-05-07'),
('SUBJECT038', 'How does the imagery contribute to meaning?', 'Medium', 0, 38, '2024-05-08'),
('SUBJECT039', 'What is the main conflict?', 'Hard', 0, 39, '2024-05-09'),
('SUBJECT040', 'How does the author use dialogue?', 'Medium', 0, 40, '2024-05-10'),
('SUBJECT041', 'What does the narrator reveal about the protagonist?', 'Medium', 0, 41, '2024-05-11'),
('SUBJECT042', 'How does the author use symbolism?', 'Hard', 0, 42, '2024-05-12'),
('SUBJECT043', 'What is the significance of the climax?', 'Medium', 0, 43, '2024-05-13'),
('SUBJECT044', 'How does the setting affect character behavior?', 'Medium', 0, 44, '2024-05-14'),
('SUBJECT045', 'What is the mood created by the author?', 'Easy', 0, 45, '2024-05-15'),
('SUBJECT046', 'How does the author develop theme?', 'Medium', 0, 46, '2024-05-16'),
('SUBJECT047', 'What is the role of the minor characters?', 'Medium', 0, 47, '2024-05-17'),
('SUBJECT048', 'How does the author create suspense?', 'Hard', 0, 48, '2024-05-18'),
('SUBJECT049', 'What is the effect of the setting?', 'Medium', 0, 49, '2024-05-19'),
('SUBJECT050', 'How does the author use point of view?', 'Medium', 0, 50, '2024-05-20'),
('SUBJECT051', 'What is the significance of the metaphor?', 'Medium', 0, 51, '2024-05-21'),
('SUBJECT052', 'How does the author develop the protagonist?', 'Medium', 0, 52, '2024-05-22'),
('SUBJECT053', 'What is the tone of the passage?', 'Easy', 0, 53, '2024-05-23'),
('SUBJECT054', 'How does the author use imagery?', 'Medium', 0, 54, '2024-05-24'),
('SUBJECT055', 'What is the main idea of the passage?', 'Medium', 0, 55, '2024-05-25'),
('SUBJECT056', 'How does the dialogue reveal character?', 'Medium', 0, 56, '2024-05-26'),
('SUBJECT057', 'What is the effect of the climax?', 'Hard', 0, 57, '2024-05-27'),
('SUBJECT058', 'How does the author use flashback?', 'Medium', 0, 58, '2024-05-28'),
('SUBJECT059', 'What is the significance of the title?', 'Medium', 0, 59, '2024-05-29'),
('SUBJECT060', 'How does the author develop conflict?', 'Hard', 0, 60, '2024-05-30'),
('SUBJECT061', 'What mood does the passage convey?', 'Easy', 0, 61, '2024-05-31'),
('SUBJECT062', 'How does the author build tension?', 'Medium', 0, 62, '2024-06-01'),
('SUBJECT063', 'What is the effect of the imagery?', 'Medium', 0, 63, '2024-06-02'),
('SUBJECT064', 'How does the setting influence the mood?', 'Medium', 0, 64, '2024-06-03'),
('SUBJECT065', 'What is the significance of the character’s actions?', 'Hard', 0, 65, '2024-06-04'),
('SUBJECT066', 'How does the author use foreshadowing?', 'Medium', 0, 66, '2024-06-05'),
('SUBJECT067', 'What is the role of the narrator?', 'Medium', 0, 67, '2024-06-06'),
('SUBJECT068', 'How does the author develop theme?', 'Medium', 0, 68, '2024-06-07'),
('SUBJECT069', 'What is the effect of the dialogue?', 'Medium', 0, 69, '2024-06-08'),
('SUBJECT070', 'How does the author use symbolism?', 'Hard', 0, 70, '2024-06-09'),
('SUBJECT071', 'What is the significance of the climax?', 'Medium', 0, 71, '2024-06-10'),
('SUBJECT072', 'How does the setting affect the plot?', 'Medium', 0, 72, '2024-06-11'),
('SUBJECT073', 'What mood is created by the author?', 'Easy', 0, 73, '2024-06-12'),
('SUBJECT074', 'How does the author create suspense?', 'Medium', 0, 74, '2024-06-13'),
('SUBJECT075', 'What is the role of the protagonist?', 'Medium', 0, 75, '2024-06-14'),
('SUBJECT076', 'How does the author use imagery?', 'Medium', 0, 76, '2024-06-15'),
('SUBJECT077', 'What is the tone of the passage?', 'Easy', 0, 77, '2024-06-16'),
('SUBJECT078', 'How does the dialogue reveal character?', 'Medium', 0, 78, '2024-06-17'),
('SUBJECT079', 'What is the main conflict?', 'Hard', 0, 79, '2024-06-18'),
('SUBJECT080', 'How does the author develop plot?', 'Medium', 0, 80, '2024-06-19'),
('SUBJECT081', 'What is the effect of the metaphor?', 'Medium', 0, 81, '2024-06-20'),
('SUBJECT082', 'How does the author develop the antagonist?', 'Medium', 0, 82, '2024-06-21'),
('SUBJECT083', 'What is the significance of the first paragraph?', 'Hard', 0, 83, '2024-06-22'),
('SUBJECT084', 'How does the author use flashbacks?', 'Medium', 0, 84, '2024-06-23'),
('SUBJECT085', 'What is the tone of the narrator?', 'Easy', 0, 85, '2024-06-24'),
('SUBJECT086', 'How does the dialogue advance the plot?', 'Medium', 0, 86, '2024-06-25'),
('SUBJECT087', 'What is the role of minor characters?', 'Medium', 0, 87, '2024-06-26'),
('SUBJECT088', 'How does the author build tension?', 'Hard', 0, 88, '2024-06-27'),
('SUBJECT089', 'What is the effect of the imagery?', 'Medium', 0, 89, '2024-06-28'),
('SUBJECT090', 'How does the setting affect character behavior?', 'Medium', 0, 90, '2024-06-29'),
('SUBJECT091', 'What is the mood created by the author?', 'Easy', 0, 91, '2024-06-30'),
('SUBJECT092', 'How does the author develop the protagonist?', 'Medium', 0, 92, '2024-07-01'),
('SUBJECT093', 'What is the significance of the title?', 'Hard', 0, 93, '2024-07-02'),
('SUBJECT094', 'How does the author use symbolism?', 'Medium', 0, 94, '2024-07-03'),
('SUBJECT095', 'What is the effect of the climax?', 'Medium', 0, 95, '2024-07-04'),
('SUBJECT096', 'How does the dialogue reveal character?', 'Medium', 0, 96, '2024-07-05'),
('SUBJECT097', 'What is the main idea of the passage?', 'Medium', 0, 97, '2024-07-06'),
('SUBJECT098', 'How does the author create suspense?', 'Medium', 0, 98, '2024-07-07'),
('SUBJECT099', 'What is the effect of the flashback?', 'Hard', 0, 99, '2024-07-08'),
('SUBJECT100', 'How does the setting influence the story?', 'Medium', 0, 100, '2024-07-09');
Go

INSERT INTO Question (SubjectID, QuestionText, DifficultyLevel, IsDuplicate, CreatedBy, CreatedDate) VALUES
('SUBJECT101', N'WHAT IS THE PAST TENSE OF THE VERB GO?', 'EASY', 0, 1, '2025-05-20'),
('SUBJECT102', N'CHOOSE THE CORRECT FORM SHE ____ TO SCHOOL EVERY DAY.', 'EASY', 0, 2, '2025-05-18'),
('SUBJECT103', N'IDENTIFY THE SYNONYM OF HAPPY.', 'MEDIUM', 0, 3, '2025-04-22'),
('SUBJECT104', N'WHAT DOES THE IDIOM BREAK THE ICE MEAN?', 'MEDIUM', 0, 4, '2025-03-30'),
('SUBJECT105', N'FILL IN THE BLANK I HAVE NEVER ____ TO PARIS.', 'EASY', 0, 5, '2025-02-15'),
('SUBJECT106', N'CHOOSE THE CORRECT PREPOSITION HE IS GOOD ____ MATH.', 'MEDIUM', 0, 6, '2025-01-10'),
('SUBJECT107', N'WHAT IS THE PLURAL FORM OF CHILD?', 'EASY', 0, 7, '2025-05-01'),
('SUBJECT108', N'DEFINE THE WORD AMBIGUOUS.', 'HARD', 0, 8, '2025-04-05'),
('SUBJECT109', N'CORRECT THE SENTENCE SHE DON''T LIKE APPLES.', 'EASY', 0, 9, '2025-03-12'),
('SUBJECT110', N'EXPLAIN THE USE OF PRESENT PERFECT TENSE.', 'MEDIUM', 0, 10, '2025-02-20'),
('SUBJECT111', N'WHAT IS A COMPLEX SENTENCE?', 'MEDIUM', 0, 11, '2025-05-10'),
('SUBJECT112', N'CHOOSE THE CORRECT FORM OF VERB TO BE.', 'EASY', 0, 12, '2025-04-01'),
('SUBJECT113', N'WHAT IS AN IDIOM?', 'EASY', 0, 13, '2025-03-15'),
('SUBJECT114', N'DESCRIBE THE FUNCTION OF ADJECTIVES.', 'MEDIUM', 0, 14, '2025-02-28'),
('SUBJECT115', N'WHAT IS THE DIFFERENCE BETWEEN SIMILE AND METAPHOR?', 'HARD', 0, 15, '2025-01-30'),
('SUBJECT116', N'GIVE AN EXAMPLE OF A CONDITIONAL SENTENCE.', 'MEDIUM', 0, 16, '2025-05-05'),
('SUBJECT117', N'EXPLAIN THE RULES OF PUNCTUATION.', 'HARD', 0, 17, '2025-04-20'),
('SUBJECT118', N'WHAT IS THE SUBJECT IN A SENTENCE?', 'EASY', 0, 18, '2025-03-25'),
('SUBJECT119', N'DESCRIBE THE TENSE USED FOR FUTURE PLANS.', 'MEDIUM', 0, 19, '2025-02-12'),
('SUBJECT120', N'WHAT ARE PHRASAL VERBS?', 'MEDIUM', 0, 20, '2025-01-22'),
('SUBJECT121', N'CHOOSE THE CORRECT ARTICLE IN THE SENTENCE.', 'EASY', 0, 21, '2025-05-14'),
('SUBJECT122', N'DEFINE THE TERM HOMOPHONES.', 'HARD', 0, 22, '2025-04-08'),
('SUBJECT123', N'WHAT IS A SYNONYM?', 'EASY', 0, 23, '2025-03-02'),
('SUBJECT124', N'WHAT IS THE DIFFERENCE BETWEEN ACTIVE AND PASSIVE VOICE?', 'MEDIUM', 0, 24, '2025-02-25'),
('SUBJECT125', N'GIVE EXAMPLES OF IRREGULAR VERBS.', 'MEDIUM', 0, 25, '2025-01-18'),
('SUBJECT126', N'WHAT IS A PREFIX?', 'EASY', 0, 26, '2025-05-08'),
('SUBJECT127', N'EXPLAIN THE MEANING OF SUFFIXES.', 'MEDIUM', 0, 27, '2025-04-16'),
('SUBJECT128', N'DESCRIBE THE USE OF MODAL VERBS.', 'MEDIUM', 0, 28, '2025-03-10'),
('SUBJECT129', N'WHAT IS AN INTERJECTION?', 'EASY', 0, 29, '2025-02-22'),
('SUBJECT130', N'DEFINE THE TERM COLLOCATION.', 'HARD', 0, 30, '2025-01-28'),
('SUBJECT131', N'WHAT IS THE PURPOSE OF A PARAGRAPH?', 'EASY', 0, 31, '2025-05-19'),
('SUBJECT132', N'WHAT IS A CLAUSE?', 'MEDIUM', 0, 32, '2025-04-12'),
('SUBJECT133', N'EXPLAIN THE DIFFERENCE BETWEEN COUNTABLE AND UNCOUNTABLE NOUNS.', 'MEDIUM', 0, 33, '2025-03-18'),
('SUBJECT134', N'WHAT IS A DIRECT OBJECT?', 'EASY', 0, 34, '2025-02-08'),
('SUBJECT135', N'WHAT ARE PRONOUNS?', 'EASY', 0, 35, '2025-01-20'),
('SUBJECT136', N'DEFINE THE TERM CONJUNCTION.', 'MEDIUM', 0, 36, '2025-05-03'),
('SUBJECT137', N'WHAT IS AN OXYMORON?', 'HARD', 0, 37, '2025-04-25'),
('SUBJECT138', N'GIVE AN EXAMPLE OF A METAPHOR.', 'EASY', 0, 38, '2025-03-29'),
('SUBJECT139', N'WHAT IS A SIMILE?', 'EASY', 0, 39, '2025-02-18'),
('SUBJECT140', N'EXPLAIN THE USE OF THE PAST PERFECT TENSE.', 'MEDIUM', 0, 40, '2025-01-26'),
('SUBJECT141', N'DESCRIBE THE ROLE OF ADVERBS.', 'MEDIUM', 0, 41, '2025-05-07'),
('SUBJECT142', N'WHAT IS A GERUND?', 'MEDIUM', 0, 42, '2025-04-14'),
('SUBJECT143', N'CHOOSE THE CORRECT FORM OF THE VERB IN THE SENTENCE.', 'EASY', 0, 43, '2025-03-07'),
('SUBJECT144', N'WHAT IS A PREPOSITION?', 'EASY', 0, 44, '2025-02-05'),
('SUBJECT145', N'DEFINE THE TERM IDIOM.', 'MEDIUM', 0, 45, '2025-01-15'),
('SUBJECT146', N'WHAT IS THE FUNCTION OF A SUBJECT COMPLEMENT?', 'HARD', 0, 46, '2025-05-17'),
('SUBJECT147', N'WHAT ARE TRANSITIVE VERBS?', 'MEDIUM', 0, 47, '2025-04-09'),
('SUBJECT148', N'DESCRIBE THE USE OF THE FUTURE CONTINUOUS TENSE.', 'MEDIUM', 0, 48, '2025-03-14'),
('SUBJECT149', N'WHAT IS A SENTENCE FRAGMENT?', 'EASY', 0, 49, '2025-02-28'),
('SUBJECT150', N'EXPLAIN THE TERM HOMONYMS.', 'HARD', 0, 50, '2025-01-12'),
('SUBJECT151', N'WHAT IS A COMPOUND SENTENCE?', 'MEDIUM', 0, 51, '2025-05-13'),
('SUBJECT152', N'DESCRIBE THE DIFFERENCE BETWEEN DIRECT AND INDIRECT SPEECH.', 'HARD', 0, 52, '2025-04-19'),
('SUBJECT153', N'WHAT IS AN ARTICLE?', 'EASY', 0, 53, '2025-03-06'),
('SUBJECT154', N'GIVE EXAMPLES OF DEMONSTRATIVE PRONOUNS.', 'EASY', 0, 54, '2025-02-11'),
('SUBJECT155', N'WHAT IS A RELATIVE CLAUSE?', 'MEDIUM', 0, 55, '2025-01-21'),
('SUBJECT156', N'DEFINE THE TERM CONDITIONAL SENTENCE.', 'MEDIUM', 0, 56, '2025-05-04'),
('SUBJECT157', N'WHAT IS A PHRASE?', 'EASY', 0, 57, '2025-04-23'),
('SUBJECT158', N'EXPLAIN THE USE OF THE PRESENT CONTINUOUS TENSE.', 'EASY', 0, 58, '2025-03-20'),
('SUBJECT159', N'WHAT IS A NOUN PHRASE?', 'MEDIUM', 0, 59, '2025-02-16'),
('SUBJECT160', N'WHAT ARE COUNTABLE NOUNS?', 'EASY', 0, 60, '2025-01-25'),
('SUBJECT161', N'WHAT IS A PRONOUN ANTECEDENT?', 'MEDIUM', 0, 61, '2025-05-09'),
('SUBJECT162', N'DEFINE THE TERM SYNONYM.', 'EASY', 0, 62, '2025-04-11'),
('SUBJECT163', N'WHAT IS THE PURPOSE OF PUNCTUATION?', 'EASY', 0, 63, '2025-03-04'),
('SUBJECT164', N'EXPLAIN THE DIFFERENCE BETWEEN A VERB AND A NOUN.', 'EASY', 0, 64, '2025-02-09'),
('SUBJECT165', N'WHAT IS A PARTICIPLE?', 'MEDIUM', 0, 65, '2025-01-19'),
('SUBJECT166', N'DESCRIBE THE USE OF THE IMPERATIVE MOOD.', 'MEDIUM', 0, 66, '2025-05-06'),
('SUBJECT167', N'WHAT IS A COMPLEMENT?', 'MEDIUM', 0, 67, '2025-04-15'),
('SUBJECT168', N'WHAT ARE IRREGULAR PLURALS?', 'EASY', 0, 68, '2025-03-11'),
('SUBJECT169', N'WHAT IS AN AUXILIARY VERB?', 'MEDIUM', 0, 69, '2025-02-21'),
('SUBJECT170', N'DEFINE THE TERM TENSE.', 'EASY', 0, 70, '2025-01-27'),
('SUBJECT171', N'WHAT IS A SUBORDINATE CLAUSE?', 'MEDIUM', 0, 71, '2025-05-16'),
('SUBJECT172', N'WHAT IS A SIMPLE SENTENCE?', 'EASY', 0, 72, '2025-04-13'),
('SUBJECT173', N'DESCRIBE THE USE OF THE PAST CONTINUOUS TENSE.', 'MEDIUM', 0, 73, '2025-03-17'),
('SUBJECT174', N'WHAT IS A PRONOUN?', 'EASY', 0, 74, '2025-02-07'),
('SUBJECT175', N'WHAT IS A GERUND PHRASE?', 'MEDIUM', 0, 75, '2025-01-16'),
('SUBJECT176', N'DEFINE THE TERM ONOMATOPOEIA.', 'HARD', 0, 76, '2025-05-02'),
('SUBJECT177', N'WHAT IS A FIGURATIVE LANGUAGE?', 'HARD', 0, 77, '2025-04-21'),
('SUBJECT178', N'WHAT IS AN EXCLAMATION?', 'EASY', 0, 78, '2025-03-28'),
('SUBJECT179', N'EXPLAIN THE FUNCTION OF A DIRECT OBJECT.', 'MEDIUM', 0, 79, '2025-02-17'),
('SUBJECT180', N'WHAT IS A COMPOUND NOUN?', 'EASY', 0, 80, '2025-01-24'),
('SUBJECT181', N'DEFINE THE TERM PRONOMINAL ADJECTIVE.', 'HARD', 0, 81, '2025-05-11'),
('SUBJECT182', N'WHAT IS A TRANSITIVE VERB?', 'MEDIUM', 0, 82, '2025-04-07'),
('SUBJECT183', N'WHAT IS AN INTRANSITIVE VERB?', 'MEDIUM', 0, 83, '2025-03-13'),
('SUBJECT184', N'WHAT IS A MODAL VERB?', 'EASY', 0, 84, '2025-02-13'),
('SUBJECT185', N'EXPLAIN THE TERM PHONETICS.', 'HARD', 0, 85, '2025-01-14'),
('SUBJECT186', N'WHAT IS A HOMOGRAPH?', 'HARD', 0, 86, '2025-05-01'),
('SUBJECT187', N'DESCRIBE THE USE OF THE FUTURE PERFECT TENSE.', 'HARD', 0, 87, '2025-04-18'),
('SUBJECT188', N'WHAT IS A PRONOUN REFERENCE?', 'MEDIUM', 0, 88, '2025-03-09'),
('SUBJECT189', N'WHAT IS A CLAUSE?', 'EASY', 0, 89, '2025-02-06'),
('SUBJECT190', N'DEFINE THE TERM DIALECT.', 'HARD', 0, 90, '2025-01-17'),
('SUBJECT191', N'WHAT IS A LEXICON?', 'MEDIUM', 0, 91, '2025-05-15'),
('SUBJECT192', N'WHAT IS AN ANTONYM?', 'EASY', 0, 92, '2025-04-14'),
('SUBJECT193', N'WHAT IS A NOUN?', 'EASY', 0, 93, '2025-03-03'),
('SUBJECT194', N'DESCRIBE THE FUNCTION OF A VERB.', 'EASY', 0, 94, '2025-02-10'),
('SUBJECT195', N'WHAT IS A SENTENCE?', 'EASY', 0, 95, '2025-01-23'),
('SUBJECT196', N'WHAT IS A PARAGRAPH?', 'EASY', 0, 96, '2025-05-12'),
('SUBJECT197', N'DEFINE THE TERM SYNTAX.', 'HARD', 0, 97, '2025-04-03'),
('SUBJECT198', N'WHAT IS A PREFIX?', 'EASY', 0, 98, '2025-03-21'),
('SUBJECT199', N'WHAT IS A SUFFIX?', 'EASY', 0, 99, '2025-02-19'),
('SUBJECT200', N'EXPLAIN THE TERM MORPHOLOGY.', 'HARD', 0, 100, '2025-01-29');
Go

INSERT INTO Question (SubjectID, QuestionText, DifficultyLevel, IsDuplicate, CreatedBy, CreatedDate) VALUES
('SUBJECT201', N'What is the past tense of the verb "go"?', 'Easy', 0, 201, '2025-05-01'),
('SUBJECT202', N'Explain the difference between "their", "there", and "they''re".', 'Medium', 0, 202, '2025-05-01'),
('SUBJECT203', N'Write a sentence using the present perfect tense.', 'Medium', 0, 203, '2025-05-01'),
('SUBJECT204', N'What is the comparative form of the adjective "good"?', 'Easy', 0, 204, '2025-05-01'),
('SUBJECT205', N'Identify the subject and predicate in this sentence: "The dog barked loudly."', 'Easy', 0, 205, '2025-05-01'),
('SUBJECT206', N'What is the difference between "will" and "going to" for future plans?', 'Medium', 0, 206, '2025-05-01'),
('SUBJECT207', N'Complete the sentence: "If I ___ (be) you, I would study harder."', 'Hard', 0, 207, '2025-05-01'),
('SUBJECT208', N'Define the term "idiom" and give an example.', 'Medium', 0, 208, '2025-05-01'),
('SUBJECT209', N'What is a phrasal verb? Provide two examples.', 'Medium', 0, 209, '2025-05-01'),
('SUBJECT210', N'Explain the use of modal verbs in expressing advice.', 'Medium', 0, 210, '2025-05-01'),
('SUBJECT211', N'What is the passive voice form of the sentence: "She writes a letter"?', 'Medium', 0, 211, '2025-05-01'),
('SUBJECT212', N'Identify the error in the sentence: "He don''t like coffee."', 'Easy', 0, 212, '2025-05-01'),
('SUBJECT213', N'Write a short paragraph describing your favorite holiday.', 'Easy', 0, 213, '2025-05-01'),
('SUBJECT214', N'What is the meaning of the word "ambiguous"?', 'Medium', 0, 214, '2025-05-01'),
('SUBJECT215', N'Explain the difference between countable and uncountable nouns.', 'Medium', 0, 215, '2025-05-01'),
('SUBJECT216', N'What is the function of conjunctions in a sentence?', 'Easy', 0, 216, '2025-05-01'),
('SUBJECT217', N'Choose the correct word: "There/Their/They''re" going to the market.', 'Easy', 0, 217, '2025-05-01'),
('SUBJECT218', N'Define the term "synonym" and provide three examples.', 'Easy', 0, 218, '2025-05-01'),
('SUBJECT219', N'What are the different types of sentences based on purpose?', 'Medium', 0, 219, '2025-05-01'),
('SUBJECT220', N'Explain how to form the past continuous tense.', 'Medium', 0, 220, '2025-05-01'),
('SUBJECT221', N'Write the plural form of the following nouns: "child", "mouse", "knife".', 'Easy', 0, 221, '2025-05-01'),
('SUBJECT222', N'What is reported speech? Give an example.', 'Medium', 0, 222, '2025-05-01'),
('SUBJECT223', N'Fill in the blank with the correct preposition: "She is interested ___ learning languages."', 'Easy', 0, 223, '2025-05-01'),
('SUBJECT224', N'What is the difference between "since" and "for" when talking about time?', 'Medium', 0, 224, '2025-05-01'),
('SUBJECT225', N'Explain the use of articles "a", "an", and "the".', 'Medium', 0, 225, '2025-05-01'),
('SUBJECT226', N'What is the main idea of a paragraph?', 'Easy', 0, 226, '2025-05-01'),
('SUBJECT227', N'Write a sentence using the conditional type 2.', 'Medium', 0, 227, '2025-05-01'),
('SUBJECT228', N'Identify the adjective in the sentence: "The quick brown fox jumps over the lazy dog."', 'Easy', 0, 228, '2025-05-01'),
('SUBJECT229', N'Explain the difference between direct and indirect objects.', 'Medium', 0, 229, '2025-05-01'),
('SUBJECT230', N'What is the purpose of a conjunction?', 'Easy', 0, 230, '2025-05-01'),
('SUBJECT231', N'Write a dialogue between two people planning a trip.', 'Medium', 0, 231, '2025-05-01'),
('SUBJECT232', N'What is an adverb? Give three examples.', 'Easy', 0, 232, '2025-05-01'),
('SUBJECT233', N'Explain the difference between "much" and "many".', 'Medium', 0, 233, '2025-05-01'),
('SUBJECT234', N'Complete the sentence: "I have never ___ (see) such a beautiful place."', 'Medium', 0, 234, '2025-05-01'),
('SUBJECT235', N'What is the difference between "say" and "tell"?', 'Medium', 0, 235, '2025-05-01'),
('SUBJECT236', N'Write a sentence using a relative clause.', 'Medium', 0, 236, '2025-05-01'),
('SUBJECT237', N'Define the term "homophone" and give two examples.', 'Medium', 0, 237, '2025-05-01'),
('SUBJECT238', N'What is the function of an interjection?', 'Easy', 0, 238, '2025-05-01'),
('SUBJECT239', N'Explain the difference between "affect" and "effect".', 'Hard', 0, 239, '2025-05-01'),
('SUBJECT240', N'Write the past participle of the verb "write".', 'Easy', 0, 240, '2025-05-01'),
('SUBJECT241', N'What is the meaning of the idiom "break the ice"?', 'Medium', 0, 241, '2025-05-01'),
('SUBJECT242', N'Complete the sentence: "She ___ (study) English for five years."', 'Medium', 0, 242, '2025-05-01'),
('SUBJECT243', N'Explain the difference between "can" and "may".', 'Medium', 0, 243, '2025-05-01'),
('SUBJECT244', N'Write a sentence in the future perfect tense.', 'Hard', 0, 244, '2025-05-01'),
('SUBJECT245', N'What is a conjunction? Provide examples.', 'Easy', 0, 245, '2025-05-01'),
('SUBJECT246', N'Describe the function of a pronoun.', 'Easy', 0, 246, '2025-05-01'),
('SUBJECT247', N'What is the difference between "few" and "a few"?', 'Medium', 0, 247, '2025-05-01'),
('SUBJECT248', N'Write a sentence using the passive voice.', 'Medium', 0, 248, '2025-05-01'),
('SUBJECT249', N'Explain how to form the present continuous tense.', 'Easy', 0, 249, '2025-05-01'),
('SUBJECT250', N'What is the superlative form of "beautiful"?', 'Easy', 0, 250, '2025-05-01'),
('SUBJECT251', N'Write a question using the auxiliary verb "do".', 'Easy', 0, 251, '2025-05-01'),
('SUBJECT252', N'Explain the use of "although" in a sentence.', 'Medium', 0, 252, '2025-05-01'),
('SUBJECT253', N'What is the difference between "some" and "any"?', 'Medium', 0, 253, '2025-05-01'),
('SUBJECT254', N'Define the term "collocation".', 'Medium', 0, 254, '2025-05-01'),
('SUBJECT255', N'Write a sentence using the past perfect tense.', 'Hard', 0, 255, '2025-05-01'),
('SUBJECT256', N'Identify the verb in the sentence: "They are playing football."', 'Easy', 0, 256, '2025-05-01'),
('SUBJECT257', N'What is the difference between "hear" and "listen"?', 'Medium', 0, 257, '2025-05-01'),
('SUBJECT258', N'Write a sentence using a conditional type 1.', 'Medium', 0, 258, '2025-05-01'),
('SUBJECT259', N'Explain the use of "since" in present perfect tense.', 'Medium', 0, 259, '2025-05-01'),
('SUBJECT260', N'What is the plural form of "analysis"?', 'Hard', 0, 260, '2025-05-01'),
('SUBJECT261', N'Write a sentence using an adjective clause.', 'Medium', 0, 261, '2025-05-01'),
('SUBJECT262', N'What is the difference between "borrow" and "lend"?', 'Medium', 0, 262, '2025-05-01'),
('SUBJECT263', N'Explain the term "modal verb" with examples.', 'Medium', 0, 263, '2025-05-01'),
('SUBJECT264', N'What is the function of an article?', 'Easy', 0, 264, '2025-05-01'),
('SUBJECT265', N'Write the third conditional sentence for this situation: "If I had known, I would have come."', 'Hard', 0, 265, '2025-05-01'),
('SUBJECT266', N'What is the antonym of "happy"?', 'Easy', 0, 266, '2025-05-01'),
('SUBJECT267', N'Explain the difference between "yet" and "already".', 'Medium', 0, 267, '2025-05-01'),
('SUBJECT268', N'Write a sentence using a gerund.', 'Medium', 0, 268, '2025-05-01'),
('SUBJECT269', N'Define "compound sentence" and give an example.', 'Medium', 0, 269, '2025-05-01'),
('SUBJECT270', N'What is the meaning of "once in a blue moon"?', 'Medium', 0, 270, '2025-05-01'),
('SUBJECT271', N'Write a sentence using an infinitive.', 'Medium', 0, 271, '2025-05-01'),
('SUBJECT272', N'What is the difference between "affect" and "effect"?', 'Hard', 0, 272, '2025-05-01'),
('SUBJECT273', N'Explain the use of the subjunctive mood.', 'Hard', 0, 273, '2025-05-01'),
('SUBJECT274', N'Write a sentence using the past continuous tense.', 'Medium', 0, 274, '2025-05-01'),
('SUBJECT275', N'What is the difference between "somebody" and "anybody"?', 'Easy', 0, 275, '2025-05-01'),
('SUBJECT276', N'Explain the difference between "say" and "speak".', 'Medium', 0, 276, '2025-05-01'),
('SUBJECT277', N'Write a sentence using a relative pronoun.', 'Medium', 0, 277, '2025-05-01'),
('SUBJECT278', N'What is the function of a conjunction?', 'Easy', 0, 278, '2025-05-01'),
('SUBJECT279', N'Define the term "homonym".', 'Medium', 0, 279, '2025-05-01'),
('SUBJECT280', N'Write a sentence using a prepositional phrase.', 'Medium', 0, 280, '2025-05-01'),
('SUBJECT281', N'Explain the difference between "lay" and "lie".', 'Hard', 0, 281, '2025-05-01'),
('SUBJECT282', N'What is the meaning of "to hit the nail on the head"?', 'Medium', 0, 282, '2025-05-01'),
('SUBJECT283', N'Write a sentence using the future continuous tense.', 'Medium', 0, 283, '2025-05-01'),
('SUBJECT284', N'Explain the difference between "few" and "little".', 'Medium', 0, 284, '2025-05-01'),
('SUBJECT285', N'Write the plural form of "analysis".', 'Hard', 0, 285, '2025-05-01'),
('SUBJECT286', N'What is the difference between "who" and "whom"?', 'Hard', 0, 286, '2025-05-01'),
('SUBJECT287', N'Define "ellipsis" in grammar.', 'Medium', 0, 287, '2025-05-01'),
('SUBJECT288', N'Write a sentence using a noun clause.', 'Medium', 0, 288, '2025-05-01'),
('SUBJECT289', N'What is the difference between "in spite of" and "because of"?', 'Medium', 0, 289, '2025-05-01'),
('SUBJECT290', N'Explain the use of "too" and "enough".', 'Medium', 0, 290, '2025-05-01'),
('SUBJECT291', N'Write a sentence using an adverb of frequency.', 'Easy', 0, 291, '2025-05-01'),
('SUBJECT292', N'What is the function of a conjunction?', 'Easy', 0, 292, '2025-05-01'),
('SUBJECT293', N'Write a sentence using reported speech.', 'Medium', 0, 293, '2025-05-01'),
('SUBJECT294', N'Define "collocation".', 'Medium', 0, 294, '2025-05-01'),
('SUBJECT295', N'Write a sentence using the past perfect tense.', 'Hard', 0, 295, '2025-05-01'),
('SUBJECT296', N'What is the difference between "between" and "among"?', 'Medium', 0, 296, '2025-05-01'),
('SUBJECT297', N'Explain the use of "however" in a sentence.', 'Medium', 0, 297, '2025-05-01'),
('SUBJECT298', N'Write a sentence using a conditional type 3.', 'Hard', 0, 298, '2025-05-01'),
('SUBJECT299', N'Define the term "synonym".', 'Easy', 0, 299, '2025-05-01'),
('SUBJECT300', N'What is the plural form of "mouse"?', 'Easy', 0, 300, '2025-05-01');
Go


INSERT INTO Question (SubjectID, QuestionText, DifficultyLevel, IsDuplicate, CreatedBy, CreatedDate) VALUES
('SUBJECT301', N'Write a sentence using the past perfect continuous tense.', 'Hard', 0, 301, '2025-05-01'),
('SUBJECT302', N'What is the difference between "since" and "for" when used with the present perfect?', 'Medium', 0, 302, '2025-05-01'),
('SUBJECT303', N'Define the term "phrasal verb" and provide examples.', 'Medium', 0, 303, '2025-05-01'),
('SUBJECT304', N'Write a sentence using the subjunctive mood.', 'Hard', 0, 304, '2025-05-01'),
('SUBJECT305', N'Explain the difference between "may" and "might".', 'Medium', 0, 305, '2025-05-01'),
('SUBJECT306', N'What is the plural form of "cactus"?', 'Hard', 0, 306, '2025-05-01'),
('SUBJECT307', N'Write a sentence using a gerund as a subject.', 'Medium', 0, 307, '2025-05-01'),
('SUBJECT308', N'Explain how to use "used to" in a sentence.', 'Medium', 0, 308, '2025-05-01'),
('SUBJECT309', N'Write a sentence containing a non-defining relative clause.', 'Medium', 0, 309, '2025-05-01'),
('SUBJECT310', N'Define "modal verb" and list three examples.', 'Medium', 0, 310, '2025-05-01'),
('SUBJECT311', N'What is the difference between "lend" and "borrow"?', 'Medium', 0, 311, '2025-05-01'),
('SUBJECT312', N'Write a sentence using a conditional type 0.', 'Easy', 0, 312, '2025-05-01'),
('SUBJECT313', N'Explain the difference between "few" and "a few".', 'Medium', 0, 313, '2025-05-01'),
('SUBJECT314', N'What is an idiom? Provide two examples.', 'Medium', 0, 314, '2025-05-01'),
('SUBJECT315', N'Write a sentence using an infinitive phrase.', 'Medium', 0, 315, '2025-05-01'),
('SUBJECT316', N'What is the superlative form of "bad"?', 'Easy', 0, 316, '2025-05-01'),
('SUBJECT317', N'Explain the difference between "since" and "ago".', 'Medium', 0, 317, '2025-05-01'),
('SUBJECT318', N'Write a sentence using the future perfect continuous tense.', 'Hard', 0, 318, '2025-05-01'),
('SUBJECT319', N'Define the term "collocation".', 'Medium', 0, 319, '2025-05-01'),
('SUBJECT320', N'What is the difference between "advice" and "advise"?', 'Medium', 0, 320, '2025-05-01'),
('SUBJECT321', N'Write a question using the auxiliary verb "did".', 'Easy', 0, 321, '2025-05-01'),
('SUBJECT322', N'Explain the function of conjunctions in complex sentences.', 'Medium', 0, 322, '2025-05-01'),
('SUBJECT323', N'Write a sentence using a prepositional phrase.', 'Easy', 0, 323, '2025-05-01'),
('SUBJECT324', N'What is the difference between "say" and "tell"?', 'Medium', 0, 324, '2025-05-01'),
('SUBJECT325', N'Define the term "homophone". Provide examples.', 'Medium', 0, 325, '2025-05-01'),
('SUBJECT326', N'Write a sentence using the passive voice.', 'Medium', 0, 326, '2025-05-01'),
('SUBJECT327', N'What is the function of an interjection?', 'Easy', 0, 327, '2025-05-01'),
('SUBJECT328', N'Explain the difference between "may" and "can".', 'Medium', 0, 328, '2025-05-01'),
('SUBJECT329', N'Write a sentence using reported speech.', 'Medium', 0, 329, '2025-05-01'),
('SUBJECT330', N'Define the term "synonym".', 'Easy', 0, 330, '2025-05-01'),
('SUBJECT331', N'What is the plural form of "child"?', 'Easy', 0, 331, '2025-05-01'),
('SUBJECT332', N'Write a sentence using a conditional type 3.', 'Hard', 0, 332, '2025-05-01'),
('SUBJECT333', N'Explain how to form the present perfect continuous tense.', 'Medium', 0, 333, '2025-05-01'),
('SUBJECT334', N'What is the difference between "who" and "whom"?', 'Hard', 0, 334, '2025-05-01'),
('SUBJECT335', N'Write a sentence using a noun clause.', 'Medium', 0, 335, '2025-05-01'),
('SUBJECT336', N'What is the function of pronouns?', 'Easy', 0, 336, '2025-05-01'),
('SUBJECT337', N'Explain the difference between "much" and "many".', 'Medium', 0, 337, '2025-05-01'),
('SUBJECT338', N'Write a sentence using a relative pronoun.', 'Medium', 0, 338, '2025-05-01'),
('SUBJECT339', N'Define "ellipsis" in grammar.', 'Medium', 0, 339, '2025-05-01'),
('SUBJECT340', N'What is the function of articles?', 'Easy', 0, 340, '2025-05-01'),
('SUBJECT341', N'Write a sentence using the past continuous tense.', 'Medium', 0, 341, '2025-05-01'),
('SUBJECT342', N'Explain the difference between "affect" and "effect".', 'Hard', 0, 342, '2025-05-01'),
('SUBJECT343', N'What is the function of adjectives?', 'Easy', 0, 343, '2025-05-01'),
('SUBJECT344', N'Write a sentence using an adverb.', 'Easy', 0, 344, '2025-05-01'),
('SUBJECT345', N'Define the term "compound sentence".', 'Medium', 0, 345, '2025-05-01'),
('SUBJECT346', N'Explain the difference between "some" and "any".', 'Medium', 0, 346, '2025-05-01'),
('SUBJECT347', N'Write a sentence using the future continuous tense.', 'Medium', 0, 347, '2025-05-01'),
('SUBJECT348', N'What is the superlative form of "beautiful"?', 'Easy', 0, 348, '2025-05-01'),
('SUBJECT349', N'Write a sentence using the third conditional.', 'Hard', 0, 349, '2025-05-01'),
('SUBJECT350', N'Define "collocation" and give examples.', 'Medium', 0, 350, '2025-05-01'),
('SUBJECT351', N'Explain the use of modal verbs in expressing necessity.', 'Medium', 0, 351, '2025-05-01'),
('SUBJECT352', N'Write a sentence using a conditional type 2.', 'Medium', 0, 352, '2025-05-01'),
('SUBJECT353', N'What is the plural form of "analysis"?', 'Hard', 0, 353, '2025-05-01'),
('SUBJECT354', N'Write a sentence using the passive voice in the past tense.', 'Medium', 0, 354, '2025-05-01'),
('SUBJECT355', N'Explain the difference between "lay" and "lie".', 'Hard', 0, 355, '2025-05-01'),
('SUBJECT356', N'Write a sentence using an infinitive as an object.', 'Medium', 0, 356, '2025-05-01'),
('SUBJECT357', N'What is the function of adverbs of frequency?', 'Easy', 0, 357, '2025-05-01'),
('SUBJECT358', N'Write a sentence using a prepositional phrase.', 'Easy', 0, 358, '2025-05-01'),
('SUBJECT359', N'Define the term "homonym".', 'Medium', 0, 359, '2025-05-01'),
('SUBJECT360', N'Explain the difference between "hear" and "listen".', 'Medium', 0, 360, '2025-05-01'),
('SUBJECT361', N'Write a sentence using reported speech in the past tense.', 'Medium', 0, 361, '2025-05-01'),
('SUBJECT362', N'What is the plural form of "mouse"?', 'Easy', 0, 362, '2025-05-01'),
('SUBJECT363', N'Write a sentence using the past perfect tense.', 'Hard', 0, 363, '2025-05-01'),
('SUBJECT364', N'Explain the use of "although" in complex sentences.', 'Medium', 0, 364, '2025-05-01'),
('SUBJECT365', N'What is the function of conjunctions?', 'Easy', 0, 365, '2025-05-01'),
('SUBJECT366', N'Write a sentence using a gerund as an object.', 'Medium', 0, 366, '2025-05-01'),
('SUBJECT367', N'Define the term "adjective clause".', 'Medium', 0, 367, '2025-05-01'),
('SUBJECT368', N'Explain the difference between "may" and "might".', 'Medium', 0, 368, '2025-05-01'),
('SUBJECT369', N'Write a sentence using the subjunctive mood.', 'Hard', 0, 369, '2025-05-01'),
('SUBJECT370', N'What is the function of pronouns?', 'Easy', 0, 370, '2025-05-01'),
('SUBJECT371', N'Write a sentence using a noun clause.', 'Medium', 0, 371, '2025-05-01'),
('SUBJECT372', N'Explain the difference between "few" and "little".', 'Medium', 0, 372, '2025-05-01'),
('SUBJECT373', N'Define the term "idiom".', 'Medium', 0, 373, '2025-05-01'),
('SUBJECT374', N'Write a sentence using a relative clause.', 'Medium', 0, 374, '2025-05-01'),
('SUBJECT375', N'What is the difference between "since" and "for"?', 'Medium', 0, 375, '2025-05-01'),
('SUBJECT376', N'Write a sentence using the future perfect tense.', 'Hard', 0, 376, '2025-05-01'),
('SUBJECT377', N'Explain the use of modal verbs in expressing possibility.', 'Medium', 0, 377, '2025-05-01'),
('SUBJECT378', N'Write a sentence using a conditional type 1.', 'Medium', 0, 378, '2025-05-01'),
('SUBJECT379', N'What is the plural form of "cactus"?', 'Hard', 0, 379, '2025-05-01'),
('SUBJECT380', N'Write a sentence using the past continuous tense.', 'Medium', 0, 380, '2025-05-01'),
('SUBJECT381', N'Define "collocation" and provide examples.', 'Medium', 0, 381, '2025-05-01'),
('SUBJECT382', N'Explain the difference between "some" and "any".', 'Medium', 0, 382, '2025-05-01'),
('SUBJECT383', N'Write a sentence using an adverbial clause.', 'Medium', 0, 383, '2025-05-01'),
('SUBJECT384', N'What is the difference between "between" and "among"?', 'Medium', 0, 384, '2025-05-01'),
('SUBJECT385', N'Define the term "compound-complex sentence".', 'Hard', 0, 385, '2025-05-01'),
('SUBJECT386', N'Write a sentence using the present continuous tense.', 'Easy', 0, 386, '2025-05-01'),
('SUBJECT387', N'Explain how to form negative sentences in the past tense.', 'Medium', 0, 387, '2025-05-01'),
('SUBJECT388', N'What is the difference between "too" and "enough"?', 'Medium', 0, 388, '2025-05-01'),
('SUBJECT389', N'Write a sentence using the second conditional.', 'Medium', 0, 389, '2025-05-01'),
('SUBJECT390', N'What is the plural form of "criterion"?', 'Hard', 0, 390, '2025-05-01'),
('SUBJECT391', N'Write a sentence using indirect speech.', 'Medium', 0, 391, '2025-05-01'),
('SUBJECT392', N'Define the term "conjunction" and give examples.', 'Easy', 0, 392, '2025-05-01'),
('SUBJECT393', N'Explain the use of tag questions in English.', 'Medium', 0, 393, '2025-05-01'),
('SUBJECT394', N'Write a sentence using the present perfect tense.', 'Medium', 0, 394, '2025-05-01'),
('SUBJECT395', N'What is a reflexive pronoun? Provide examples.', 'Easy', 0, 395, '2025-05-01'),
('SUBJECT396', N'Define "comparative adjective" and write a sentence using one.', 'Easy', 0, 396, '2025-05-01'),
('SUBJECT397', N'What is the difference between "each" and "every"?', 'Medium', 0, 397, '2025-05-01'),
('SUBJECT398', N'Write a sentence using an exclamatory sentence structure.', 'Easy', 0, 398, '2025-05-01'),
('SUBJECT399', N'Define the term "participle" and provide examples.', 'Medium', 0, 399, '2025-05-01'),
('SUBJECT400', N'What is the function of transition words in writing?', 'Medium', 0, 400, '2025-05-01');
Go

INSERT INTO Question (SubjectID, QuestionText, DifficultyLevel, IsDuplicate, CreatedBy, CreatedDate) VALUES
('SUBJECT401', N'Write a sentence using the future continuous tense.', 'Medium', 0, 401, '2025-05-01'),
('SUBJECT402', N'Explain how to use "unless" in conditional sentences.', 'Medium', 0, 402, '2025-05-01'),
('SUBJECT403', N'What is a gerund? Provide three examples.', 'Easy', 0, 403, '2025-05-01'),
('SUBJECT404', N'Write a sentence using the past perfect tense.', 'Medium', 0, 404, '2025-05-01'),
('SUBJECT405', N'Define "interrogative sentence" and give an example.', 'Easy', 0, 405, '2025-05-01'),
('SUBJECT406', N'What is the difference between "say" and "tell"?', 'Medium', 0, 406, '2025-05-01'),
('SUBJECT407', N'Write a dialogue using at least one idiom.', 'Hard', 0, 407, '2025-05-01'),
('SUBJECT408', N'Explain the use of passive voice in English.', 'Medium', 0, 408, '2025-05-01'),
('SUBJECT409', N'Write a sentence using a noun clause.', 'Medium', 0, 409, '2025-05-01'),
('SUBJECT410', N'What is the difference between "can" and "could"?', 'Easy', 0, 410, '2025-05-01'),
('SUBJECT411', N'Define "adverb of frequency" and provide examples.', 'Easy', 0, 411, '2025-05-01'),
('SUBJECT412', N'Write a question using the third conditional.', 'Hard', 0, 412, '2025-05-01'),
('SUBJECT413', N'Explain what a phrasal verb is and give examples.', 'Medium', 0, 413, '2025-05-01'),
('SUBJECT414', N'Write a paragraph describing your daily routine.', 'Easy', 0, 414, '2025-05-01'),
('SUBJECT415', N'What is the role of punctuation in written English?', 'Medium', 0, 415, '2025-05-01'),
('SUBJECT416', N'Define the term "relative pronoun" and give examples.', 'Medium', 0, 416, '2025-05-01'),
('SUBJECT417', N'Write a sentence using the expression "used to".', 'Easy', 0, 417, '2025-05-01'),
('SUBJECT418', N'What are question words? List and define five.', 'Easy', 0, 418, '2025-05-01'),
('SUBJECT419', N'Explain the difference between "shall" and "will".', 'Medium', 0, 419, '2025-05-01'),
('SUBJECT420', N'Write a short story using at least three different verb tenses.', 'Hard', 0, 420, '2025-05-01'),
('SUBJECT421', N'Identify and correct the mistake: "She don’t like coffee."', 'Easy', 0, 421, '2025-05-01'),
('SUBJECT422', N'Write a sentence using "although" to show contrast.', 'Medium', 0, 422, '2025-05-01'),
('SUBJECT423', N'Explain the use of "will have done" in future perfect tense.', 'Hard', 0, 423, '2025-05-01'),
('SUBJECT424', N'What is the difference between "few" and "a few"?', 'Medium', 0, 424, '2025-05-01'),
('SUBJECT425', N'Write a paragraph about your last holiday using past tenses.', 'Medium', 0, 425, '2025-05-01'),
('SUBJECT426', N'List five common irregular verbs and their past forms.', 'Easy', 0, 426, '2025-05-01'),
('SUBJECT427', N'What are time expressions used with present perfect?', 'Medium', 0, 427, '2025-05-01'),
('SUBJECT428', N'Write a sentence using "should have" to express regret.', 'Medium', 0, 428, '2025-05-01'),
('SUBJECT429', N'Create a dialogue between a teacher and student about homework.', 'Medium', 0, 429, '2025-05-01'),
('SUBJECT430', N'Define and give examples of the present continuous tense.', 'Easy', 0, 430, '2025-05-01'),
('SUBJECT431', N'Explain subject-verb agreement with third-person singular.', 'Medium', 0, 431, '2025-05-01'),
('SUBJECT432', N'Write a sentence in the passive voice using future tense.', 'Medium', 0, 432, '2025-05-01'),
('SUBJECT433', N'What is an article? Give examples of "a", "an", and "the".', 'Easy', 0, 433, '2025-05-01'),
('SUBJECT434', N'Describe a famous person using at least five adjectives.', 'Easy', 0, 434, '2025-05-01'),
('SUBJECT435', N'Write a conversation using three phrasal verbs.', 'Hard', 0, 435, '2025-05-01'),
('SUBJECT436', N'Explain how to use reported questions in indirect speech.', 'Hard', 0, 436, '2025-05-01'),
('SUBJECT437', N'Correct this sentence: "He can sings very well."', 'Easy', 0, 437, '2025-05-01'),
('SUBJECT438', N'Write a story using the past perfect and simple past.', 'Hard', 0, 438, '2025-05-01'),
('SUBJECT439', N'What are modal verbs? Give five examples.', 'Easy', 0, 439, '2025-05-01'),
('SUBJECT440', N'Define "preposition of time" with three example sentences.', 'Medium', 0, 440, '2025-05-01'),
('SUBJECT441', N'Write a paragraph comparing two cities.', 'Medium', 0, 441, '2025-05-01'),
('SUBJECT442', N'What is a compound sentence? Create one.', 'Easy', 0, 442, '2025-05-01'),
('SUBJECT443', N'Use "as soon as" in a sentence with past tense.', 'Medium', 0, 443, '2025-05-01'),
('SUBJECT444', N'Write a question using the present perfect continuous.', 'Hard', 0, 444, '2025-05-01'),
('SUBJECT445', N'Describe your best friend using comparatives and superlatives.', 'Medium', 0, 445, '2025-05-01'),
('SUBJECT446', N'What are conditional sentences? Name the four types.', 'Medium', 0, 446, '2025-05-01'),
('SUBJECT447', N'Write a complex sentence showing cause and effect.', 'Hard', 0, 447, '2025-05-01'),
('SUBJECT448', N'Give the definition and example of an imperative sentence.', 'Easy', 0, 448, '2025-05-01'),
('SUBJECT449', N'Write a dialogue in a restaurant using appropriate expressions.', 'Medium', 0, 449, '2025-05-01'),
('SUBJECT450', N'Differentiate between "who", "whom", and "whose".', 'Hard', 0, 450, '2025-05-01'),
('SUBJECT451', N'What is a tag question? Write two examples.', 'Easy', 0, 451, '2025-05-01'),
('SUBJECT452', N'Write a sentence with an infinitive of purpose.', 'Medium', 0, 452, '2025-05-01'),
('SUBJECT453', N'Use "neither...nor" in a sentence.', 'Medium', 0, 453, '2025-05-01'),
('SUBJECT454', N'Identify the subject and predicate in this sentence: "The cat slept on the mat."', 'Easy', 0, 454, '2025-05-01'),
('SUBJECT455', N'Write a paragraph using at least three linking words.', 'Medium', 0, 455, '2025-05-01'),
('SUBJECT456', N'What is inversion in English grammar? Give an example.', 'Hard', 0, 456, '2025-05-01'),
('SUBJECT457', N'Correct this sentence: "I has went to the market."', 'Easy', 0, 457, '2025-05-01'),
('SUBJECT458', N'Explain the structure of a persuasive paragraph.', 'Medium', 0, 458, '2025-05-01'),
('SUBJECT459', N'Use "either...or" in a meaningful sentence.', 'Medium', 0, 459, '2025-05-01'),
('SUBJECT460', N'Write a formal letter applying for a job.', 'Hard', 0, 460, '2025-05-01'),
('SUBJECT461', N'Define and give an example of an exclamatory sentence.', 'Easy', 0, 461, '2025-05-01'),
('SUBJECT462', N'What are the rules for using commas in lists?', 'Medium', 0, 462, '2025-05-01'),
('SUBJECT463', N'Write a conditional sentence expressing a present unreal situation.', 'Hard', 0, 463, '2025-05-01'),
('SUBJECT464', N'List and define the four sentence types in English.', 'Medium', 0, 464, '2025-05-01'),
('SUBJECT465', N'Use three adverbs of manner in a short paragraph.', 'Medium', 0, 465, '2025-05-01'),
('SUBJECT466', N'Write a complaint letter to a hotel manager.', 'Hard', 0, 466, '2025-05-01'),
('SUBJECT467', N'Explain the use of "nevertheless" and "however" with examples.', 'Medium', 0, 467, '2025-05-01'),
('SUBJECT468', N'Write five questions using "how much" and "how many".', 'Easy', 0, 468, '2025-05-01'),
('SUBJECT469', N'Create a story using at least two modal verbs.', 'Hard', 0, 469, '2025-05-01'),
('SUBJECT470', N'What is an appositive? Give two examples.', 'Medium', 0, 470, '2025-05-01'),
('SUBJECT471', N'Use "wish" in a sentence about a past event.', 'Medium', 0, 471, '2025-05-01'),
('SUBJECT472', N'Write five negative sentences using "must not".', 'Easy', 0, 472, '2025-05-01'),
('SUBJECT473', N'Correct the following: "He don’t has any idea."', 'Easy', 0, 473, '2025-05-01'),
('SUBJECT474', N'Write a short paragraph using passive voice.', 'Medium', 0, 474, '2025-05-01'),
('SUBJECT475', N'Define conjunctions and list five common ones.', 'Easy', 0, 475, '2025-05-01'),
('SUBJECT476', N'Write a sentence using a conditional type 2.', 'Medium', 0, 476, '2025-05-01'),
('SUBJECT477', N'What is the role of a thesis statement in an essay?', 'Medium', 0, 477, '2025-05-01'),
('SUBJECT478', N'Use "had better" in two sentences.', 'Medium', 0, 478, '2025-05-01'),
('SUBJECT479', N'Write a review of a movie you recently watched.', 'Medium', 0, 479, '2025-05-01'),
('SUBJECT480', N'Define "collocation" and give three examples.', 'Medium', 0, 480, '2025-05-01'),
('SUBJECT481', N'Create a dialogue at an airport.', 'Medium', 0, 481, '2025-05-01'),
('SUBJECT482', N'Correct the grammar mistake: "He didn’t went to school."', 'Easy', 0, 482, '2025-05-01'),
('SUBJECT483', N'Explain the use of question tags in English.', 'Medium', 0, 483, '2025-05-01'),
('SUBJECT484', N'Write a paragraph about your dream job.', 'Easy', 0, 484, '2025-05-01'),
('SUBJECT485', N'Use "so that" and "in order to" in different sentences.', 'Medium', 0, 485, '2025-05-01'),
('SUBJECT486', N'List five synonyms of the word "happy".', 'Easy', 0, 486, '2025-05-01'),
('SUBJECT487', N'What is parallel structure? Give examples.', 'Medium', 0, 487, '2025-05-01'),
('SUBJECT488', N'Write a descriptive paragraph about your house.', 'Easy', 0, 488, '2025-05-01'),
('SUBJECT489', N'Write a letter inviting a friend to your birthday party.', 'Easy', 0, 489, '2025-05-01'),
('SUBJECT490', N'Define "intensifier" and give examples.', 'Medium', 0, 490, '2025-05-01'),
('SUBJECT491', N'Write a paragraph using at least three conditional sentences.', 'Hard', 0, 491, '2025-05-01'),
('SUBJECT492', N'Use five different quantifiers in a short paragraph.', 'Medium', 0, 492, '2025-05-01'),
('SUBJECT493', N'Write about your favorite season using descriptive language.', 'Easy', 0, 493, '2025-05-01'),
('SUBJECT494', N'List five transition words and use them in sentences.', 'Easy', 0, 494, '2025-05-01'),
('SUBJECT495', N'Explain the difference between "will" and "going to".', 'Medium', 0, 495, '2025-05-01'),
('SUBJECT496', N'Write a short biography of a famous person.', 'Medium', 0, 496, '2025-05-01'),
('SUBJECT497', N'What are adverbial clauses? Give examples.', 'Medium', 0, 497, '2025-05-01'),
('SUBJECT498', N'Create a dialogue between two friends discussing a school project.', 'Medium', 0, 498, '2025-05-01'),
('SUBJECT499', N'Correct this: "She can to play the piano."', 'Easy', 0, 499, '2025-05-01'),
('SUBJECT500', N'Write a paragraph expressing your opinion about online learning.', 'Medium', 0, 500, '2025-05-01');
Go










SELECT * FROM Users;



DELETE FROM Task;


--Tạo dữ liệu tự động cho bảng Task
DECLARE @i INT = 1;
DECLARE @userId INT;
DECLARE @templateText NVARCHAR(MAX);  -- Thêm dòng khai báo biến này

-- Danh sách mô tả đa dạng cho task tiếng Anh
DECLARE @TaskTemplates TABLE (Template NVARCHAR(MAX));
INSERT INTO @TaskTemplates (Template)
VALUES 
(N'Prepare lesson plan on past tense grammar.'),
(N'Create vocabulary quiz for unit 4.'),
(N'Design speaking activity for conversation practice.'),
(N'Grade students’ writing assignments.'),
(N'Review and update English curriculum materials.'),
(N'Organize group discussion for reading comprehension.'),
(N'Check homework and provide individual feedback.'),
(N'Prepare listening practice using audio clips.'),
(N'Design interactive slides for online class.'),
(N'Develop worksheets for irregular verbs.'),
(N'Plan revision session before the midterm test.'),
(N'Prepare reading materials from news articles.'),
(N'Conduct peer evaluation for speaking exercises.'),
(N'Update attendance and participation logs.'),
(N'Create Kahoot quiz for vocabulary review.');

-- Lấy danh sách UserID từ Users
DECLARE @UserList TABLE (UserID INT);
INSERT INTO @UserList (UserID) SELECT UserID FROM Users;
DECLARE @userCount INT = (SELECT COUNT(*) FROM @UserList);

-- Khai báo biến cho random Status
DECLARE @randStatus INT;
DECLARE @status NVARCHAR(50);

WHILE @i <= 500
BEGIN
    -- Gán user vòng tròn
    SELECT @userId = UserID
    FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum, UserID
        FROM @UserList
    ) AS OrderedUsers
    WHERE RowNum = ((@i - 1) % @userCount) + 1;

    -- Lấy ngẫu nhiên 1 mô tả từ danh sách
    SELECT TOP 1 @templateText = Template 
    FROM @TaskTemplates
    ORDER BY NEWID();

    -- Random trạng thái Status
    SET @randStatus = (ABS(CHECKSUM(NEWID())) % 4) + 1;
    IF @randStatus = 1 SET @status = N'Pending';
    ELSE IF @randStatus = 2 SET @status = N'In Progress';
    ELSE IF @randStatus = 3 SET @status = N'Completed';
    ELSE SET @status = N'On Hold';

    -- Chèn dữ liệu
    INSERT INTO Task (AssignedTo, SubjectID, TaskDescription, Status, DueDate)
    VALUES (
        @userId,
        CONCAT('SUBJECT', RIGHT('000' + CAST(@i AS NVARCHAR), 3)),
        @templateText,
        @status,
        DATEADD(DAY, @i, GETDATE())
    );

    SET @i = @i + 1;
END
GO





--Tạo dữ liệu tự động cho bảng Exam
DECLARE @i INT = 1;
DECLARE @easy INT;
DECLARE @medium INT;
DECLARE @hard INT;
DECLARE @difficulty NVARCHAR(100);

WHILE @i <= 500
BEGIN
    -- Tạo số câu hỏi ngẫu nhiên từ 20 đến 100
    DECLARE @totalQuestions INT = FLOOR(RAND(CHECKSUM(NEWID())) * 81) + 20;

    -- Tạo tỉ lệ độ khó sao cho tổng = 100%
    SET @easy = FLOOR(RAND(CHECKSUM(NEWID())) * 61) + 20; -- 20 - 80
    SET @medium = FLOOR(RAND(CHECKSUM(NEWID())) * (100 - @easy - 10)) + 10; -- ít nhất 10%
    SET @hard = 100 - @easy - @medium;

    SET @difficulty = CONCAT(
        'Easy ', CAST(@easy AS NVARCHAR), '%, ',
        'Medium ', CAST(@medium AS NVARCHAR), '%, ',
        'Hard ', CAST(@hard AS NVARCHAR), '%'
    );

    INSERT INTO Exam (SubjectID, ExamDate, TotalQuestions, DifficultyPercentage)
    VALUES (
        CONCAT('SUBJECT', RIGHT('000' + CAST(@i AS NVARCHAR), 3)),
        DATEADD(DAY, @i, GETDATE()),
        @totalQuestions,
        @difficulty
    );

    SET @i = @i + 1;
END
GO







-- Tạo dữ liệu tự động cho bảng Notification
DECLARE @i INT = 1;
DECLARE @userId INT;
DECLARE @message NVARCHAR(MAX);
DECLARE @isRead BIT;

DECLARE @MessageTemplates TABLE (Template NVARCHAR(MAX));
INSERT INTO @MessageTemplates (Template)
VALUES 
(N'You have a new assignment to complete.'),
(N'Your exam schedule has been updated.'),
(N'Please review the latest course materials.'),
(N'New announcement from the department.'),
(N'Your task deadline is approaching.'),
(N'Attendance record has been updated.'),
(N'Please check your grades online.'),
(N'New forum post in your subject.'),
(N'Reminder: upcoming meeting tomorrow.'),
(N'Update your profile information.'),
(N'Course feedback survey is available.'),
(N'Your request has been approved.'),
(N'Please submit your project report.'),
(N'New resource added to the library.'),
(N'Your password will expire soon.');

DECLARE @UserList TABLE (UserID INT);
INSERT INTO @UserList (UserID) SELECT UserID FROM Users;
DECLARE @userCount INT = (SELECT COUNT(*) FROM @UserList);

WHILE @i <= 500
BEGIN
    SELECT @userId = UserID
    FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum, UserID
        FROM @UserList
    ) AS OrderedUsers
    WHERE RowNum = ((@i - 1) % @userCount) + 1;

    SELECT TOP 1 @message = Template FROM @MessageTemplates ORDER BY NEWID();

    SET @isRead = CASE WHEN (@i % 3) = 0 THEN 1 ELSE 0 END;

    INSERT INTO Notification (UserID, Message, IsRead, CreatedDate)
    VALUES (
        @userId,
        @message,
        @isRead,
        DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 30), CAST(GETDATE() AS DATE))
    );

    SET @i = @i + 1;
END
GO









USE [QBCA_DB];
GO
SELECT TABLE_SCHEMA, TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';




DROP TABLE IF EXISTS QuestionPairs ;


CREATE TABLE QuestionPairs (
    PairID INT IDENTITY(1,1) PRIMARY KEY,
    Question1 NVARCHAR(MAX) NOT NULL,
    Question2 NVARCHAR(MAX) NOT NULL,
    Label BIT NOT NULL,  -- 1 nếu trùng, 0 nếu không trùng
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO





-- BƯỚC 1: Đảm bảo SubjectID 'ENG101' tồn tại trong bảng Subject
IF NOT EXISTS (SELECT 1 FROM Subject WHERE SubjectID = 'ENG101')
BEGIN
    INSERT INTO Subject (SubjectID, SubjectName)
    VALUES ('ENG101', N'English Basic')  -- Thêm dòng Subject mẫu
END

-- BƯỚC 2: Tạo dữ liệu mẫu cho bảng Question (tự nhân bản từ dữ liệu có sẵn)
INSERT INTO Question (SubjectID, QuestionText, DifficultyLevel, CreatedBy, CreatedDate)
SELECT TOP 1000 
    'ENG101',
    QuestionText + ' [Copy ' + LEFT(CONVERT(varchar(36), NEWID()), 5) + ']',
    DifficultyLevel,
    ISNULL(CreatedBy, 1), -- Nếu CreatedBy bị NULL thì gán tạm là 1
    GETDATE()
FROM Question
ORDER BY NEWID();

-- BƯỚC 3: Tạo 500 cặp câu hỏi ngẫu nhiên và chèn vào bảng QuestionPairs
WITH RandomPairs AS (
    SELECT TOP 500
        Q1.QuestionText AS Question1,
        Q2.QuestionText AS Question2,
        CASE 
            WHEN Q1.QuestionText = Q2.QuestionText THEN 1
            WHEN Q1.QuestionText LIKE Q2.QuestionText + '%' 
              OR Q2.QuestionText LIKE Q1.QuestionText + '%' THEN 1
            ELSE 0
        END AS Label
    FROM Question Q1
    INNER JOIN Question Q2 ON Q1.QuestionID < Q2.QuestionID
    ORDER BY NEWID()
)
INSERT INTO QuestionPairs (Question1, Question2, Label)
SELECT Question1, Question2, Label FROM RandomPairs;











CREATE TABLE Submission (
    SubmissionID INT IDENTITY(1,1) PRIMARY KEY,
    SubmittedBy INT,
    SubjectID NVARCHAR(20),
    SubmitDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50), -- Pending, Approved, Rejected
    FOREIGN KEY (SubmittedBy) REFERENCES Users(UserID),
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);



CREATE TABLE SubmissionDetails (
    SubmissionDetailID INT IDENTITY(1,1) PRIMARY KEY,
    SubmissionID INT,
    QuestionID INT,
    FOREIGN KEY (SubmissionID) REFERENCES Submission(SubmissionID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);


DROP TABLE IF EXISTS DuplicateReview;

CREATE TABLE DuplicateReview (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    QuestionID INT,
    DuplicateWithQuestionID INT,
    IsDuplicate BIT, -- Suggestion từ AI: 1 (trùng), 0 (không trùng)
    Approved BIT NULL, -- NULL: chưa xử lý, 1: chấp nhận là trùng, 0: từ chối
    ReviewedBy INT NULL,
    ReviewDate DATETIME NULL,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY (DuplicateWithQuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY (ReviewedBy) REFERENCES Users(UserID)
);





CREATE TABLE ExamReview (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    ExamID INT,
    ReviewedBy INT,
    Comments NVARCHAR(MAX),
    ReviewDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (ReviewedBy) REFERENCES Users(UserID)
);




CREATE TABLE ApprovalLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    ActionType NVARCHAR(50), -- 'SubmissionApproval', 'ExamApproval', ...
    RelatedID INT, -- ID của bảng liên quan (ExamID, SubmissionID, etc.)
    ApprovedBy INT,
    ApprovedDate DATETIME DEFAULT GETDATE(),
    Remarks NVARCHAR(MAX),
    FOREIGN KEY (ApprovedBy) REFERENCES Users(UserID)
);




CREATE TABLE AIResultLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    QuestionID INT,
    ComparedWithID INT,
    SimilarityScore FLOAT,
    IsDuplicate BIT, -- AI đề xuất
    CheckedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY (ComparedWithID) REFERENCES Question(QuestionID)
);




CREATE TABLE QuestionChangeLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    QuestionID INT,
    Action NVARCHAR(20),        -- 'INSERT', 'UPDATE', 'DELETE'
    OldQuestionText NVARCHAR(MAX) NULL,  -- null nếu INSERT
    NewQuestionText NVARCHAR(MAX) NULL,  -- null nếu DELETE
    ChangedBy INT,
    ChangeDate DATETIME DEFAULT GETDATE(),
    Remarks NVARCHAR(MAX) NULL,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY (ChangedBy) REFERENCES Users(UserID)
);





DROP TABLE IF EXISTS DeletedQuestionsArchive;
CREATE TABLE DeletedQuestionsArchive (
    ArchiveID INT IDENTITY(1,1) PRIMARY KEY,
    OriginalQuestionID INT,
    SubjectID NVARCHAR(20),
    QuestionText NVARCHAR(MAX),
    DifficultyLevel NVARCHAR(50),
    DeletedBy INT,
    DeletedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (DeletedBy) REFERENCES Users(UserID)
);




DROP TABLE IF EXISTS QuestionEditRequest ;
CREATE TABLE QuestionEditRequest (
    RequestID INT IDENTITY(1,1) PRIMARY KEY,
    QuestionID INT,
    RequestedBy INT,
    ProposedText NVARCHAR(MAX),
    Status NVARCHAR(50) DEFAULT 'Pending',  -- Pending, Approved, Rejected
    ReviewedBy INT NULL,
    RequestDate DATETIME DEFAULT GETDATE(),
    ReviewDate DATETIME NULL,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY (RequestedBy) REFERENCES Users(UserID),
    FOREIGN KEY (ReviewedBy) REFERENCES Users(UserID)
);







-- thêm dữ liệu tự động cho bảng Submission
DECLARE @UserIDs TABLE (UserID INT);
DECLARE @SubjectIDs TABLE (SubjectID NVARCHAR(20));

INSERT INTO @UserIDs (UserID)
SELECT UserID FROM Users;

INSERT INTO @SubjectIDs (SubjectID)
SELECT SubjectID FROM Subject;

IF (SELECT COUNT(*) FROM @UserIDs) = 0 OR (SELECT COUNT(*) FROM @SubjectIDs) = 0
BEGIN
    PRINT 'Bảng Users hoặc Subject chưa có dữ liệu!';
    RETURN;
END

DECLARE @i INT = 1;
DECLARE @Max INT = 500;

DECLARE @RandomUserID INT;
DECLARE @RandomSubjectID NVARCHAR(20);
DECLARE @RandomStatus NVARCHAR(50);
DECLARE @SubmitDate DATETIME;

DECLARE @Statuses TABLE (Status NVARCHAR(50));
INSERT INTO @Statuses (Status)
VALUES ('Pending'), ('Approved'), ('Rejected');

DECLARE @UserCount INT = (SELECT COUNT(*) FROM @UserIDs);
DECLARE @SubjectCount INT = (SELECT COUNT(*) FROM @SubjectIDs);
DECLARE @StatusCount INT = (SELECT COUNT(*) FROM @Statuses);

WHILE @i <= @Max
BEGIN
    SELECT TOP 1 @RandomUserID = UserID 
    FROM (SELECT ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn, UserID FROM @UserIDs) AS t 
    WHERE rn = ABS(CHECKSUM(NEWID())) % @UserCount + 1;

    SELECT TOP 1 @RandomSubjectID = SubjectID 
    FROM (SELECT ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn, SubjectID FROM @SubjectIDs) AS t 
    WHERE rn = ABS(CHECKSUM(NEWID())) % @SubjectCount + 1;

    SELECT TOP 1 @RandomStatus = Status
    FROM (SELECT ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn, Status FROM @Statuses) AS st
    WHERE rn = ABS(CHECKSUM(NEWID())) % @StatusCount + 1;

    SET @SubmitDate = DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 180), GETDATE());

    INSERT INTO Submission (SubmittedBy, SubjectID, SubmitDate, Status)
    VALUES (@RandomUserID, @RandomSubjectID, @SubmitDate, @RandomStatus);

    SET @i = @i + 1;
END

PRINT 'Đã thêm 500 dòng dữ liệu vào bảng Submission.';







-- Tạo 500 dòng dữ liệu ngẫu nhiên cho SubmissionDetails 
WITH RandomSubmissionDetails AS (
    SELECT TOP 500
        S.SubmissionID,
        Q.QuestionID
    FROM Submission S
    CROSS JOIN Question Q
    ORDER BY NEWID()
)
INSERT INTO SubmissionDetails (SubmissionID, QuestionID)
SELECT SubmissionID, QuestionID FROM RandomSubmissionDetails;





-- Tạo 500 dòng dữ liệu ngẫu nhiên cho DuplicateReview

WITH QuestionPairs AS (
    SELECT TOP 500
        Q1.QuestionID AS QuestionID,
        Q2.QuestionID AS DuplicateWithQuestionID,
        CAST(CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 1 ELSE 0 END AS BIT) AS IsDuplicate
    FROM Question Q1
    INNER JOIN Question Q2 ON Q1.QuestionID < Q2.QuestionID  -- Tránh cặp chính nó và lặp lại
    ORDER BY NEWID()
)
INSERT INTO DuplicateReview (QuestionID, DuplicateWithQuestionID, IsDuplicate)
SELECT QuestionID, DuplicateWithQuestionID, IsDuplicate
FROM QuestionPairs;










-- Tạo 500 dòng dữ liệu ngẫu nhiên cho bảng ExamReview

WITH RandomReviews AS (
    SELECT TOP 500
        E.ExamID,
        U.UserID AS ReviewedBy,
        N'Bình luận tự động ' + CAST(ROW_NUMBER() OVER (ORDER BY NEWID()) AS NVARCHAR) AS Comments
    FROM Exam E
    CROSS JOIN Users U
    ORDER BY NEWID()
)
INSERT INTO ExamReview (ExamID, ReviewedBy, Comments)
SELECT ExamID, ReviewedBy, Comments
FROM RandomReviews;







-- Tạo bảng tạm với các ActionType để random
DECLARE @ActionTypes TABLE (ActionType NVARCHAR(50));
INSERT INTO @ActionTypes (ActionType)
VALUES ('SubmissionApproval'), ('ExamApproval'), ('QuestionApproval');

-- Tạo dữ liệu ApprovalLog ngẫu nhiên
WITH RandomLogs AS (
    SELECT TOP 500
        AT.ActionType,
        CASE 
            WHEN AT.ActionType = 'SubmissionApproval' THEN S.SubmissionID
            WHEN AT.ActionType = 'ExamApproval' THEN E.ExamID
            WHEN AT.ActionType = 'QuestionApproval' THEN Q.QuestionID
        END AS RelatedID,
        U.UserID AS ApprovedBy,
        N'Duyệt tự động #' + CAST(ROW_NUMBER() OVER (ORDER BY NEWID()) AS NVARCHAR) AS Remarks
    FROM @ActionTypes AT
    OUTER APPLY (
        SELECT TOP 1 SubmissionID FROM Submission ORDER BY NEWID()
    ) S
    OUTER APPLY (
        SELECT TOP 1 ExamID FROM Exam ORDER BY NEWID()
    ) E
    OUTER APPLY (
        SELECT TOP 1 QuestionID FROM Question ORDER BY NEWID()
    ) Q
    CROSS JOIN (
        SELECT TOP 1 UserID FROM Users ORDER BY NEWID()
    ) U
)
INSERT INTO ApprovalLog (ActionType, RelatedID, ApprovedBy, Remarks)
SELECT ActionType, RelatedID, ApprovedBy, Remarks
FROM RandomLogs;






-- Tạo 500 dòng dữ liệu ApprovalLog không dùng bảng tạm

WITH NumberGen AS (
    SELECT TOP 500 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum
    FROM sys.all_objects
),
RandomLogs AS (
    SELECT
        CASE ABS(CHECKSUM(NEWID())) % 3
            WHEN 0 THEN 'SubmissionApproval'
            WHEN 1 THEN 'ExamApproval'
            ELSE 'QuestionApproval'
        END AS ActionType,
        -- RelatedID sẽ được chọn dựa vào ActionType
        U.UserID AS ApprovedBy,
        N'Duyệt tự động #' + CAST(RowNum AS NVARCHAR) AS Remarks
    FROM NumberGen
    CROSS APPLY (
        SELECT TOP 1 UserID FROM Users ORDER BY NEWID()
    ) U
)
-- Gán RelatedID ngẫu nhiên tùy theo ActionType
INSERT INTO ApprovalLog (ActionType, RelatedID, ApprovedBy, Remarks)
SELECT
    RL.ActionType,
    CASE
        WHEN RL.ActionType = 'SubmissionApproval' THEN (SELECT TOP 1 SubmissionID FROM Submission ORDER BY NEWID())
        WHEN RL.ActionType = 'ExamApproval' THEN (SELECT TOP 1 ExamID FROM Exam ORDER BY NEWID())
        WHEN RL.ActionType = 'QuestionApproval' THEN (SELECT TOP 1 QuestionID FROM Question ORDER BY NEWID())
    END AS RelatedID,
    RL.ApprovedBy,
    RL.Remarks
FROM RandomLogs RL
WHERE
    -- Chỉ insert khi RelatedID hợp lệ
    CASE
        WHEN RL.ActionType = 'SubmissionApproval' THEN (SELECT COUNT(*) FROM Submission)
        WHEN RL.ActionType = 'ExamApproval' THEN (SELECT COUNT(*) FROM Exam)
        WHEN RL.ActionType = 'QuestionApproval' THEN (SELECT COUNT(*) FROM Question)
    END > 0;








	--tạo dữ liệu tự động cho bảng  AIResultLog
	SET NOCOUNT ON;

DECLARE @i INT = 0;

WHILE @i < 500
BEGIN
    DECLARE @QuestionID INT = FLOOR(RAND() * 500) + 1;
    DECLARE @ComparedWithID INT = FLOOR(RAND() * 500) + 1;

    -- Tránh so sánh chính nó
    IF @QuestionID <> @ComparedWithID
    BEGIN
        DECLARE @SimilarityScore FLOAT = ROUND(RAND(), 4);
        DECLARE @IsDuplicate BIT = CASE WHEN @SimilarityScore >= 0.8 THEN 1 ELSE 0 END;

        INSERT INTO AIResultLog (QuestionID, ComparedWithID, SimilarityScore, IsDuplicate)
        VALUES (@QuestionID, @ComparedWithID, @SimilarityScore, @IsDuplicate);

        SET @i = @i + 1;
    END
END









--tạo dữ liệu tự động cho bảng  QuestionChangeLog
SET NOCOUNT ON;

DECLARE @i INT = 0;

WHILE @i < 500
BEGIN
    DECLARE @QuestionID INT = FLOOR(RAND() * 500) + 1;
    DECLARE @UserID INT = FLOOR(RAND() * 50) + 1;
    DECLARE @Action NVARCHAR(20);
    DECLARE @OldText NVARCHAR(MAX);
    DECLARE @NewText NVARCHAR(MAX);
    DECLARE @Remarks NVARCHAR(MAX);

    -- Xác định hành động ngẫu nhiên: 0 = INSERT, 1 = UPDATE, 2 = DELETE
    DECLARE @RandAction INT = FLOOR(RAND() * 3);

    IF @RandAction = 0
    BEGIN
        SET @Action = 'INSERT';
        SET @OldText = NULL;
        SET @NewText = 'Newly inserted question text for ID ' + CAST(@QuestionID AS NVARCHAR);
        SET @Remarks = 'New question added';
    END
    ELSE IF @RandAction = 1
    BEGIN
        SET @Action = 'UPDATE';
        SET @OldText = 'Old version of question ID ' + CAST(@QuestionID AS NVARCHAR);
        SET @NewText = 'Updated version of question ID ' + CAST(@QuestionID AS NVARCHAR);
        SET @Remarks = 'Question updated for clarity';
    END
    ELSE
    BEGIN
        SET @Action = 'DELETE';
        SET @OldText = 'Deleted question text for ID ' + CAST(@QuestionID AS NVARCHAR);
        SET @NewText = NULL;
        SET @Remarks = 'Question removed';
    END

    -- Chèn nếu dữ liệu hợp lệ
    IF EXISTS (SELECT 1 FROM Question WHERE QuestionID = @QuestionID)
       AND EXISTS (SELECT 1 FROM Users WHERE UserID = @UserID)
    BEGIN
        INSERT INTO QuestionChangeLog (
            QuestionID, Action, OldQuestionText, NewQuestionText, ChangedBy, Remarks
        )
        VALUES (
            @QuestionID, @Action, @OldText, @NewText, @UserID, @Remarks
        );

        SET @i = @i + 1;
    END
END







--tạo dữ liệu tự động cho bảng DeletedQuestionsArchive
SET NOCOUNT ON;

DECLARE @i INT = 0;

-- Danh sách Subject mẫu
DECLARE @Subjects TABLE (SubjectID NVARCHAR(20));
INSERT INTO @Subjects VALUES ('MATH101'), ('PHYS202'), ('CHEM303'), ('BIO404'), ('ENG505');

-- Danh sách Difficulty Level mẫu
DECLARE @Difficulties TABLE (Difficulty NVARCHAR(50));
INSERT INTO @Difficulties VALUES ('Easy'), ('Medium'), ('Hard');

WHILE @i < 500
BEGIN
    DECLARE @QuestionID INT = FLOOR(RAND() * 500) + 1;
    DECLARE @DeletedBy INT = FLOOR(RAND() * 50) + 1;

    -- Lấy ngẫu nhiên SubjectID
    DECLARE @SubjectID NVARCHAR(20);
    SELECT TOP 1 @SubjectID = SubjectID FROM @Subjects ORDER BY NEWID();

    -- Lấy ngẫu nhiên Difficulty
    DECLARE @Difficulty NVARCHAR(50);
    SELECT TOP 1 @Difficulty = Difficulty FROM @Difficulties ORDER BY NEWID();

    -- Tạo Text giả cho QuestionText
    DECLARE @QuestionText NVARCHAR(MAX) = 'Deleted question text for QuestionID ' + CAST(@QuestionID AS NVARCHAR);

    -- Kiểm tra khóa ngoại DeletedBy tồn tại
    IF EXISTS (SELECT 1 FROM Users WHERE UserID = @DeletedBy)
    BEGIN
        INSERT INTO DeletedQuestionsArchive (
            OriginalQuestionID, SubjectID, QuestionText, DifficultyLevel, DeletedBy
        )
        VALUES (
            @QuestionID, @SubjectID, @QuestionText, @Difficulty, @DeletedBy
        );

        SET @i = @i + 1;
    END
END









--tạo dữ liệu tự động cho bảng QuestionEditRequest
SET NOCOUNT ON;

DECLARE @i INT = 0;

WHILE @i < 500
BEGIN
    DECLARE @QuestionID INT = FLOOR(RAND() * 500) + 1;
    DECLARE @RequestedBy INT = FLOOR(RAND() * 50) + 1;

    -- Chọn trạng thái ngẫu nhiên
    DECLARE @RandStatus INT = FLOOR(RAND() * 3); -- 0: Pending, 1: Approved, 2: Rejected
    DECLARE @Status NVARCHAR(50);
    DECLARE @ReviewedBy INT = NULL;
    DECLARE @RequestDate DATETIME = DATEADD(DAY, -FLOOR(RAND() * 60), GETDATE());  -- trong 60 ngày gần nhất
    DECLARE @ReviewDate DATETIME = NULL;
    DECLARE @ProposedText NVARCHAR(MAX);

    IF @RandStatus = 0
    BEGIN
        SET @Status = 'Pending';
        SET @ReviewedBy = NULL;
        SET @ReviewDate = NULL;
    END
    ELSE IF @RandStatus = 1
    BEGIN
        SET @Status = 'Approved';
        SET @ReviewedBy = FLOOR(RAND() * 50) + 1;
        SET @ReviewDate = DATEADD(DAY, FLOOR(RAND() * 10), @RequestDate);  -- review sau request 0-10 ngày
    END
    ELSE
    BEGIN
        SET @Status = 'Rejected';
        SET @ReviewedBy = FLOOR(RAND() * 50) + 1;
        SET @ReviewDate = DATEADD(DAY, FLOOR(RAND() * 10), @RequestDate);
    END

    SET @ProposedText = 'Proposed edit text for QuestionID ' + CAST(@QuestionID AS NVARCHAR);

    IF EXISTS (SELECT 1 FROM Question WHERE QuestionID = @QuestionID)
       AND EXISTS (SELECT 1 FROM Users WHERE UserID = @RequestedBy)
       AND (@ReviewedBy IS NULL OR EXISTS (SELECT 1 FROM Users WHERE UserID = @ReviewedBy))
    BEGIN
        INSERT INTO QuestionEditRequest (
            QuestionID, RequestedBy, ProposedText, Status, ReviewedBy, RequestDate, ReviewDate
        )
        VALUES (
            @QuestionID, @RequestedBy, @ProposedText, @Status, @ReviewedBy, @RequestDate, @ReviewDate
        );

        SET @i = @i + 1;
    END
END
