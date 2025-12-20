-- USE tutors_finder_system;

-- mật khẩu 12345678 
INSERT INTO users (full_name, email, password_hash, phone_number, status, updated_at, avatar_image, created_at, enabled)   Value
('Nguyễn Văn Admin', 'admin1@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0901111222', 'Active',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp","2025-11-01 09:00:00", true),
('Trần Thị B', 'tutor1@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0903333444', 'Active',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=1daMD_hFATKnFRec_PcXcFC4WHku_M01Z","2025-11-01 09:00:00", true),
('Lê Văn C', 'tutor2@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0905555666', 'Active',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=1FJx2fJM8p-S8AZ-XHrwOfzgr8KEqa2JT","2025-11-01 09:00:00", true),
('Phạm Thị D', 'tutor3@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0907777888', 'inActive',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=1LZ53L8bh_vS994d_KBgglE492NdVkSNb","2025-11-01 09:00:00", true),
('Ngô Minh E', 'parent1@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0911111122', 'Active',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=1KmCvjUEUZxLxXQV83ckY-CFnM4CLdJN4","2025-11-01 09:00:00", true),
('Trần Anh F', 'parent2@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0913333444', 'Active',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=17GDMG6kkNBxkNwjfTVlwNsf3OtCqzUx9","2025-11-01 09:00:00", true),
('Hoàng Văn G', 'parent3@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0915555666', 'Active',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=1ukQro3cQYUTW_Bu8pkAdULAXkV2S_Lfg","2025-11-01 09:00:00", true),
('Vũ Thị H', 'tutor4@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0908888999','Active',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=1MgrdULYoP7WM5uotEVVG_hEKGQFbsuro","2025-11-01 09:00:00", true),
('Nguyễn Minh I', 'tutor5@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0902222333', 'Active',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=1EfLS6HfHgKK2FzOBPqRswkYcVxEFEZKk","2025-11-01 09:00:00", true),
('Lâm Thị K', 'parent4@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0917777888', 'Active',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp","2025-11-01 09:00:00", true),
('Lâm Văn H', 'parent5@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0917777999', 'Active',"2025-11-01 09:00:00", "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp","2025-11-01 09:00:00", true);


INSERT INTO user_roles (user_id, role) 
VALUES  (1,  'ADMIN'), (2,  'TUTOR'), (3,  'TUTOR'),(4,  'TUTOR'), (5,  'LEARNER'),
		(6,  'LEARNER'), (7,  'LEARNER'), (8,  'TUTOR'), (9,  'TUTOR'), (10, 'LEARNER'), (11, 'LEARNER');



INSERT INTO subjects (subject_name) VALUES
-- Các môn học cốt lõi
('Toán'),
('Vật lí'),
('Hóa học'),
('Sinh học'),
('Ngữ văn'),
('Tiếng Việt'), -- Dành cho cấp 1
('Lịch sử'),
('Địa lí'),
('Tiếng Anh'),

-- Các môn xã hội và giáo dục
('Giáo dục công dân (GDCD)'),
('Đạo đức'), -- Dành cho cấp 1
('Giáo dục kinh tế và pháp luật'), -- Dành cho cấp 3 (Chương trình mới)
('Giáo dục Quốc phòng và An ninh'),

-- Các môn tích hợp (Theo chương trình mới)
('Tự nhiên và Xã hội'), -- Lớp 1, 2, 3
('Khoa học'), -- Lớp 4, 5
('Khoa học tự nhiên'), -- Cấp 2
('Lịch sử và Địa lí'), -- Cấp 2

-- Các môn công nghệ và năng khiếu
('Tin học'),
('Công nghệ'),
('Âm nhạc'),
('Mĩ thuật'),
('Giáo dục thể chất'),
('Hoạt động trải nghiệm, hướng nghiệp'),

-- Các môn kỹ năng và luyện thi phổ biến
('Luyện viết chữ đẹp'),
('Tiếng Anh giao tiếp'),
('Luyện thi IELTS'),
('Luyện thi TOEIC'),
('Lập trình'),

-- Các ngoại ngữ khác
('Tiếng Pháp'),
('Tiếng Nhật'),
('Tiếng Trung'),
('Tiếng Hàn'),
('Tiếng Đức');


INSERT INTO tutors (user_id, gender, address, university, educational_level, introduction, price_per_hour, verification_status)
VALUES
(2, 'FEMALE', 'Hà Nội', 'ĐH Sư phạm Hà Nội', 'Đại học', 'Kinh nghiệm 3 năm dạy Toán', 150000, 'APPROVED'),
(3, 'MALE', 'TP.HCM', 'ĐH Bách Khoa', 'Đại học', 'Dạy Lý chuyên cấp 3', 180000, 'APPROVED'),
(4, 'FEMALE', 'Đà Nẵng', 'ĐH Sư phạm Đà Nẵng', 'Đại học', 'Dạy Hóa nâng cao', 160000, 'APPROVED'),
(8, 'FEMALE', 'Cần Thơ', 'ĐH Cần Thơ', 'Cao học', 'Dạy tin học cơ bản và hóa nâng cao', 200000, 'APPROVED'),
(9, 'MALE', 'Huế', 'ĐH Khoa học Huế', 'Đại học', 'Gia sư tin học', 220000, 'APPROVED');

-- ===== CERTIFICATES FOR TUTOR 1 - 5 =====
INSERT INTO tutor_certificates (certificate_id, tutor_id, certificate_name, approved)
VALUES
-- Tutor 1
(1, 1, 'Chứng chỉ Sư phạm Toán học', TRUE),
(2, 1, 'IELTS 6.5 Academic', TRUE),
(3, 1, 'Giấy chứng nhận “Dạy kèm Toán THCS nâng   cao”', TRUE),

-- Tutor 2
(4, 2, 'Chứng chỉ Sư phạm Vật Lý', TRUE),
(5, 2, 'Giải Nhì Học sinh giỏi Vật Lý cấp tỉnh', TRUE),
(6, 2, 'Chứng chỉ Bồi dưỡng phương pháp dạy học STEM', TRUE),

-- Tutor 3
(7, 3, 'Giải Nhất học sỉnh giỏi sinh học cấp tỉnh', TRUE),
(8, 3, 'Giải Nhất học sinh giỏi vật lí cấp trường trung học cơ sở', TRUE),
(9, 3, 'Giải Nhì học sinh giỏi sinh học quốc gia', TRUE),

-- Tutor 4
(10, 4, 'Chứng chỉ Sư phạm Hóa học', TRUE),
(11, 4, 'Chứng chỉ Ứng dụng CNTT cơ bản', TRUE),
(12, 4, 'Giấy chứng nhận Dạy kèm Hóa THPT nâng cao', TRUE),

-- Tutor 5
(13, 5, 'MOS Microsoft Office Specialist', TRUE),
(14, 5, 'Chứng chỉ Ứng dụng CNTT nâng cao', TRUE),
(15, 5, 'Chứng chỉ Lập trình cơ bản – Bộ GD&ĐT', TRUE);

INSERT INTO tutor_certificate_files 
(file_id, certificate_id, file_url, status, is_active, uploaded_at)
VALUES
-- Tutor 1
(1, 1, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(2, 2, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(3, 3, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),

-- Tutor 2
(4, 4, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(5, 5, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(6, 6, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),

-- Tutor 3
(7, 7, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(8, 8, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(9, 9, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),

-- Tutor 4
(10, 10, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(11, 11, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(12, 12, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),

-- Tutor 5
(13, 13, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(14, 14, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(15, 15, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00");




INSERT INTO tutor_subjects (tutor_id, subject_id)
VALUES
(1, 1),  -- Toán
(1, 9),  -- Tiếng Anh
(2, 2),  -- Vật lý
(3, 3),  -- Hóa học
(4, 3), -- hóa
(5, 18), -- tin
-- (5, 28), -- Luyện thi IELTS
(2, 18), -- Tin học
(3, 4),  -- Sinh học
(4, 18);  -- tin 


INSERT INTO learner (user_id, full_name, gender, grade, school, description, address, address_detail)
VALUES
(5, 'Ngô Minh E', 'MALE', 'Lớp 7', 'THCS Trần Phú', 'Muốn học thêm Toán nâng cao', 'Hà Nội', '123 Nguyễn Trãi'),
(6, 'Trần Anh F', 'FEMALE', 'Lớp 9', 'THCS Lý Tự Trọng', 'Chuẩn bị thi vào 10', 'TP.HCM', '45 Trần Hưng Đạo'),
(7, 'Hoàng Văn G', 'MALE', 'Lớp 12', 'THPT Bùi Thị Xuân', 'Ôn thi đại học môn Lý', 'Huế', '10 Lê Lợi'),
(10, 'Lâm Thị K', 'FEMALE', 'Lớp 8', 'THCS Nguyễn Du', 'Cần học tiếng Anh giao tiếp', 'Cần Thơ', '22 Nguyễn Văn Cừ'),
(11, 'Lâm Văn H', 'MALE', 'Lớp 5', 'Tiểu học Kim Đồng', 'Cần học thêm Toán và Tiếng Việt', 'Hà Nội', '78 Trường Chinh');

    



-- INSERT INTO notifications (user_id, type, title, content, is_read)
-- VALUES
-- (1, 'ACCOUNT_VERIFIED', 'Tài khoản admin đã được xác minh', 'Quyền quản trị đã sẵn sàng.', TRUE),
-- (2, 'REQUEST_ACCEPTED', 'Yêu cầu học đã được chấp nhận', 'Bạn đã chấp nhận một yêu cầu học mới.', FALSE),
-- (3, 'NEW_REQUEST', 'Bạn có yêu cầu lớp học mới', 'Phụ huynh vừa gửi yêu cầu môn Vật lý.', FALSE),
-- (4, 'REQUEST_REJECTED', 'Yêu cầu bị từ chối', 'Bạn đã từ chối một yêu cầu không phù hợp.', TRUE),
-- (5, 'CLASS_CONFIRMED', 'Lớp học đã được xác nhận', 'Lịch học Toán bắt đầu từ 2025-11-01.', FALSE),
-- (6, 'SESSION_REMINDER', 'Nhắc lịch học tối nay', 'Buổi học lúc 18:00–19:30 hôm nay.', FALSE),
-- (7, 'RATING_RECEIVED', 'Bạn nhận được đánh giá mới', 'Điểm: 4.8 – “Giải thích dễ hiểu”.', TRUE),
-- (8, 'MATERIAL_SHARED', 'Gia sư đã chia sẻ tài liệu', 'File “Tiếng Anh giao tiếp.pdf” đã được tải lên.', FALSE),
-- (9, 'MESSAGE', 'Bạn có tin nhắn mới', 'Phụ huynh vừa nhắn tin: “Hẹn giờ học CN?”', FALSE),
-- (10, 'CLASS_CANCELLED', 'Một buổi học đã bị hủy', 'Buổi học Chủ nhật 14:00–15:30 đã hủy.', TRUE),
-- (3, 'NEW_REQUEST', 'Bạn có yêu cầu học mới', 'Học viên lớp 7 muốn học Toán', FALSE),
-- (4, 'NEW_REQUEST', 'Bạn có yêu cầu học mới', 'Học viên lớp 8 muốn học Tiếng Anh', FALSE),
-- (2, 'NEW_REQUEST', 'Bạn có yêu cầu học mới', 'Phụ huynh lớp 7 cần học Lý', FALSE),
-- (2, 'CLASS_CONFIRMED', 'Lịch học mới', 'Lớp Tin học nâng cao đã xác nhận', FALSE);





INSERT INTO ebooks (title, type, file_path, uploaded_by, created_at)
VALUES
('Toán nâng cao lớp 7', 'SACH_GIAO_KHOA', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Vật lý cơ bản', 'TAI_LIEU', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Hóa học thực hành', 'TAI_LIEU', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Tiếng Anh giao tiếp', 'TAI_LIEU', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Ôn thi IELTS 7.0', 'DE_THI_THAM_KHAO', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Luyện thi TOEIC 700+', 'DE_THI_THAM_KHAO', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Tin học cơ bản', 'SACH_GIAO_KHOA', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Kỹ năng học tập hiệu quả', 'TAI_LIEU', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Bài tập Hóa nâng cao', 'TAI_LIEU', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Bộ đề thi THPT Quốc gia', 'DE_THI_THAM_KHAO', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Toán chuyên nâng cao', 'TAI_LIEU', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW()),
('Lý nâng cao 12', 'TAI_LIEU', 'https://drive.google.com/uc?id=1xSAlqzBTv7BQ4drOuCG56IxHWYyxCblg9yXs7eC8Pzo', 1, NOW());




-- === 1. Thêm 20 users (10 tutor, 10 learner) ===
INSERT INTO users (user_id, full_name, email, password_hash, phone_number, status, created_at, updated_at, avatar_image)
VALUES
  (12, 'Nguyễn Gia Tutor 1', 'tutor6@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0906000001', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (13, 'Trần Minh Tutor 2', 'tutor7@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0907000002', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (14, 'Lê Hoài Tutor 3', 'tutor8@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0908000003', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (15, 'Phạm Hải Tutor 4', 'tutor9@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0909000004', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (16, 'Võ Thái Tutor 5', 'tutor10@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0901000005', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (17, 'Đỗ Quang Tutor 6', 'tutor11@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0901100006', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (18, 'Hoàng Yến Tutor 7', 'tutor12@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0901200007', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (19, 'Bùi Phúc Tutor 8', 'tutor13@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0901300008', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (20, 'Đinh Trang Tutor 9', 'tutor14@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0901400009', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (21, 'Cao Nhã Tutor 10', 'tutor15@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0901500010', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (22, 'Lê Học Learner 1', 'learner6@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0916000001', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (23, 'Nguyễn Học Learner 2', 'learner7@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0917000002', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (24, 'Trần Học Learner 3', 'learner8@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0918000003', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (25, 'Phạm Học Learner 4', 'learner9@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0919000004', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (26, 'Huỳnh Học Learner 5', 'learner10@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0911000005', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (27, 'Vũ Học Learner 6', 'learner11@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0911100006', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (28, 'Đoàn Học Learner 7', 'learner12@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0911200007', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (29, 'Lâm Học Learner 8', 'learner13@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0911300008', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (30, 'Đặng Học Learner 9', 'learner14@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0911400009', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp"),
  (31, 'Ngô Học Learner 10', 'learner15@example.com', '$2a$10$jVKlCQXGAu1AGMBXaM5iJe90dADLpcbTnFw9IiWiNbmfrUz045fsO', '0911500010', 'ACTIVE', '2025-11-01 09:00:00', '2025-11-01 09:00:00', "https://drive.google.com/uc?id=1vPbK0Bk8_TdF4Us0Bo7-PVofUk3SVRrp");

INSERT INTO user_roles (user_id, role) VALUES
(12, 'TUTOR'),
(13, 'TUTOR'),
(14, 'TUTOR'),
(15, 'TUTOR'),
(16, 'TUTOR'),
(17, 'TUTOR'),
(18, 'TUTOR'),
(19, 'TUTOR'),
(20, 'TUTOR'),
(21, 'TUTOR');


INSERT INTO user_roles (user_id, role) VALUES
(22, 'LEARNER'),
(23, 'LEARNER'),
(24, 'LEARNER'),
(25, 'LEARNER'),
(26, 'LEARNER'),
(27, 'LEARNER'),
(28, 'LEARNER'),
(29, 'LEARNER'),
(30, 'LEARNER'),
(31, 'LEARNER');




-- === 2. Thêm 10 tutors mới (tutor_id 6–15) ===
INSERT INTO tutors (tutor_id, address, educational_level, gender, introduction, price_per_hour, university, verification_status, user_id)
VALUES
  (6, 'TP.HCM', 'Đại học', 'FEMALE', 'Kinh nghiệm 2 năm dạy Toán THCS', 150000,  'ĐH Sư phạm TP.HCM', 'APPROVED', 12),
  (7, 'Hà Nội', 'Cao học', 'MALE', 'Gia sư Lý, luyện thi vào 10', 170000, 'ĐH Sư phạm Hà Nội', 'APPROVED', 13),
  (8, 'Đà Nẵng', 'Đại học', 'FEMALE', 'Dạy Hóa cơ bản và nâng cao', 160000, 'ĐH Bách Khoa Đà Nẵng', 'APPROVED', 14),
  (9, 'Cần Thơ', 'Đại học', 'MALE', 'Dạy tiếng Anh giao tiếp cho sinh viên', 200000, 'ĐH Cần Thơ', 'APPROVED', 15),
  (10, 'Huế', 'Đại học', 'FEMALE', 'Gia sư Ngữ văn, luyện thi THPT', 155000, 'ĐH Sư phạm Huế', 'APPROVED', 16),
  (11, 'Hải Phòng', 'Đại học', 'MALE', 'Dạy Tin học cơ bản và nâng cao', 180000, 'ĐH Hàng Hải', 'APPROVED', 17),
  (12, 'Biên Hòa', 'Đại học', 'FEMALE', 'Gia sư Toán cấp 2 và 3', 190000, 'ĐH Lạc Hồng', 'APPROVED', 18),
  (13, 'Nha Trang', 'Đại học', 'MALE', 'Dạy Sinh học, kinh nghiệm 4 năm', 175000, 'ĐH Nha Trang', 'APPROVED', 19),
  (14, 'Vũng Tàu', 'Đại học', 'FEMALE', 'Dạy tiếng Anh giao tiếp và IELTS', 210000, 'ĐH Bà Rịa – Vũng Tàu', 'APPROVED', 20),
  (15, 'Buôn Ma Thuột', 'Cao học', 'MALE', 'Dạy Lý và Hóa cho học sinh THPT', 185000, 'ĐH Tây Nguyên', 'APPROVED', 21);

-- === 3. Thêm 10 learners mới (learner_id 6–15) ===
INSERT INTO learner (learner_id, address, address_detail, description, full_name, gender, grade, school, user_id)
VALUES
  (6, 'Hà Nội', 'Số 1 Trần Duy Hưng', 'Cần học Toán và Lý cơ bản', 'Learner 6', 'MALE', 'Lớp 7', 'THCS Nguyễn Trãi', 22),
  (7, 'TP.HCM', '25 Lê Lợi', 'Cần cải thiện Tiếng Anh giao tiếp', 'Learner 7', 'FEMALE', 'Lớp 8', 'THCS Lê Quý Đôn', 23),
  (8, 'Đà Nẵng', '10 Phan Chu Trinh', 'Ôn thi vào 10 môn Toán', 'Learner 8', 'MALE', 'Lớp 9', 'THCS Hòa Khánh', 24),
  (9, 'Huế', '5 Nguyễn Huệ', 'Cần học thêm Hóa học', 'Learner 9', 'FEMALE', 'Lớp 10', 'THPT Quốc Học', 25),
  (10, 'Cần Thơ', '20 3/2', 'Luyện thi đại học khối A', 'Learner 10', 'MALE', 'Lớp 11', 'THPT Châu Văn Liêm', 26),
  (11, 'Hải Phòng', '15 Trần Phú', 'Cần củng cố kiến thức cơ bản', 'Learner 11', 'FEMALE', 'Lớp 6', 'THCS Ngô Quyền', 27),
  (12, 'Nha Trang', '8 Trần Hưng Đạo', 'Luyện thi IELTS 6.5', 'Learner 12', 'MALE', 'Lớp 12', 'THPT Lê Quý Đôn', 28),
  (13, 'Biên Hòa', '12 Đồng Khởi', 'Cần học tốt Tiếng Việt và Toán', 'Learner 13', 'FEMALE', 'Lớp 5', 'Tiểu học Tân Mai', 29),
  (14, 'Vũng Tàu', '7 Lý Thường Kiệt', 'Cần làm quen với Tiếng Anh', 'Learner 14', 'MALE', 'Lớp 4', 'Tiểu học Lê Lợi', 30),
  (15, 'Buôn Ma Thuột', '18 Hai Bà Trưng', 'Cần luyện viết chữ đẹp', 'Learner 15', 'FEMALE', 'Lớp 3', 'Tiểu học Nguyễn Du', 31);

-- === 4. Môn dạy cho 10 tutors mới ===
INSERT INTO tutor_subjects (tutor_id, subject_id)
VALUES
  (6, 1),
  (6, 9),
  (7, 2),
  (7, 18),
  (8, 3),
  (8, 4),
  (9, 9),
  (9, 27),
  (10, 1),
  (10, 18),
  (10, 28),
  (11, 2),
  (11, 3),
  (12, 4),
  (12, 9),
  (13, 1),
  (13, 27),
  (14, 28),
  (14, 29),
  (15, 18),
  (15, 9);

-- === 5. Chứng chỉ cho 10 tutors mới ===
INSERT INTO tutor_certificates (certificate_id, tutor_id, certificate_name, approved)
VALUES
(100, 6, 'Chứng chỉ sư phạm cơ bản 6', TRUE),
(101, 6, 'Chứng chỉ chuyên môn nâng cao 6', TRUE),
(102, 7, 'Chứng chỉ sư phạm cơ bản 7', TRUE),
(103, 7, 'Chứng chỉ chuyên môn nâng cao 7', TRUE),
(104, 8, 'Chứng chỉ sư phạm cơ bản 8', TRUE),
(105, 8, 'Chứng chỉ chuyên môn nâng cao 8', TRUE),
(106, 9, 'Chứng chỉ sư phạm cơ bản 9', TRUE),
(107, 9, 'Chứng chỉ chuyên môn nâng cao 9', TRUE),
(108, 10, 'Chứng chỉ sư phạm cơ bản 10', TRUE),
(109, 10, 'Chứng chỉ chuyên môn nâng cao 10', TRUE),
(110, 11, 'Chứng chỉ sư phạm cơ bản  11', TRUE),
(111, 11, 'Chứng chỉ chuyên môn nâng cao 11', TRUE),
(112, 12, 'Chứng chỉ sư phạm cơ bản 12', TRUE),
(113, 12, 'Chứng chỉ chuyên môn nâng cao 12', TRUE),
(114, 13, 'Chứng chỉ sư phạm cơ bản 13', TRUE),
(115, 13, 'Chứng chỉ chuyên môn nâng cao 13', TRUE),
(116, 14, 'Chứng chỉ sư phạm cơ bản 14', TRUE),
(117, 14, 'Chứng chỉ chuyên môn nâng cao 14', TRUE),
(118, 15, 'Chứng chỉ sư phạm cơ bản 15', TRUE),
(119, 15, 'Chứng chỉ chuyên môn nâng cao 15', TRUE);

INSERT INTO tutor_certificate_files (file_id, certificate_id, file_url, status, is_active, uploaded_at)
VALUES
(200, 100, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(201, 101, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(202, 102, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(203, 103, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(204, 104, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(205, 105, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(206, 106, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(207, 107, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),

(208, 108, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(209, 109, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),

(210, 110, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(211, 111, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(212, 112, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(213, 113, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),

(214, 114, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(215, 115, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),

(216, 116, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(217, 117, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),

(218, 118, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00"),
(219, 119, 'https://drive.google.com/uc?id=1aeQacmvYQMq3cEYj0f4mZoeYUN7mkoXuRhZzXmev3u0', 'APPROVED', TRUE, "2025-11-01 09:00:00");


INSERT INTO tutor_availability VALUES
(1,'2025-11-17 06:00:00','2025-11-17 11:00:00','2025-11-17 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(2,'2025-11-17 06:00:00','2025-11-24 11:00:00','2025-11-24 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(3,'2025-11-17 06:00:00','2025-12-01 11:00:00','2025-12-01 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(4,'2025-11-17 06:00:00','2025-12-08 11:00:00','2025-12-08 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(5,'2025-11-17 06:00:00','2025-12-15 11:00:00','2025-12-15 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(6,'2025-11-17 06:00:00','2025-12-22 11:00:00','2025-12-22 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(7,'2025-11-17 06:00:00','2025-12-29 11:00:00','2025-12-29 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(8,'2025-11-17 06:00:00','2026-01-05 11:00:00','2026-01-05 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(9,'2025-11-17 06:00:00','2026-01-12 11:00:00','2026-01-12 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(10,'2025-11-17 06:00:00','2026-01-19 11:00:00','2026-01-19 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(11,'2025-11-17 06:00:00','2026-01-26 11:00:00','2026-01-26 09:30:00','AVAILABLE','2025-11-17 06:00:00',1),
(12,'2025-11-17 06:00:00','2026-02-02 11:00:00','2026-02-02 09:30:00','AVAILABLE','2025-11-17 06:00:00',1);


INSERT INTO tutor_availability VALUES
(13,'2025-11-15 07:30:00','2025-11-15 09:30:00','2025-11-15 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(14,'2025-11-15 07:30:00','2025-11-22 09:30:00','2025-11-22 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(15,'2025-11-15 07:30:00','2025-11-29 09:30:00','2025-11-29 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(16,'2025-11-15 07:30:00','2025-12-06 09:30:00','2025-12-06 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(17,'2025-11-15 07:30:00','2025-12-13 09:30:00','2025-12-13 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(18,'2025-11-15 07:30:00','2025-12-20 09:30:00','2025-12-20 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(19,'2025-11-15 07:30:00','2025-12-27 09:30:00','2025-12-27 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(20,'2025-11-15 07:30:00','2026-01-03 09:30:00','2026-01-03 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(21,'2025-11-15 07:30:00','2026-01-10 09:30:00','2026-01-10 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(22,'2025-11-15 07:30:00','2026-01-17 09:30:00','2026-01-17 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(23,'2025-11-15 07:30:00','2026-01-24 09:30:00','2026-01-24 08:00:00','AVAILABLE','2025-11-15 07:30:00',1),
(24,'2025-11-15 07:30:00','2026-01-31 09:30:00','2026-01-31 08:00:00','AVAILABLE','2025-11-15 07:30:00',1);


INSERT INTO tutor_availability VALUES
(25,'2025-11-13 07:30:00','2025-11-13 09:30:00','2025-11-13 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(26,'2025-11-13 07:30:00','2025-11-20 09:30:00','2025-11-20 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(27,'2025-11-13 07:30:00','2025-11-27 09:30:00','2025-11-27 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(28,'2025-11-13 07:30:00','2025-12-04 09:30:00','2025-12-04 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(29,'2025-11-13 07:30:00','2025-12-11 09:30:00','2025-12-11 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(30,'2025-11-13 07:30:00','2025-12-18 09:30:00','2025-12-18 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(31,'2025-11-13 07:30:00','2025-12-25 09:30:00','2025-12-25 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(32,'2025-11-13 07:30:00','2026-01-01 09:30:00','2026-01-01 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(33,'2025-11-13 07:30:00','2026-01-08 09:30:00','2026-01-08 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(34,'2025-11-13 07:30:00','2026-01-15 09:30:00','2026-01-15 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(35,'2025-11-13 07:30:00','2026-01-22 09:30:00','2026-01-22 08:00:00','AVAILABLE','2025-11-13 07:30:00',1),
(36,'2025-11-13 07:30:00','2026-01-29 09:30:00','2026-01-29 08:00:00','AVAILABLE','2025-11-13 07:30:00',1);


INSERT INTO tutor_availability VALUES
(37,'2025-11-13 17:30:00','2025-11-13 20:00:00','2025-11-13 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(38,'2025-11-13 17:30:00','2025-11-20 20:00:00','2025-11-20 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(39,'2025-11-13 17:30:00','2025-11-27 20:00:00','2025-11-27 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(40,'2025-11-13 17:30:00','2025-12-04 20:00:00','2025-12-04 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(41,'2025-11-13 17:30:00','2025-12-11 20:00:00','2025-12-11 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(42,'2025-11-13 17:30:00','2025-12-18 20:00:00','2025-12-18 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(43,'2025-11-13 17:30:00','2025-12-25 20:00:00','2025-12-25 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(44,'2025-11-13 17:30:00','2026-01-01 20:00:00','2026-01-01 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(45,'2025-11-13 17:30:00','2026-01-08 20:00:00','2026-01-08 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(46,'2025-11-13 17:30:00','2026-01-15 20:00:00','2026-01-15 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(47,'2025-11-13 17:30:00','2026-01-22 20:00:00','2026-01-22 18:30:00','AVAILABLE','2025-11-13 17:30:00',1),
(48,'2025-11-13 17:30:00','2026-01-29 20:00:00','2026-01-29 18:30:00','AVAILABLE','2025-11-13 17:30:00',1);



INSERT INTO tutor_availability VALUES
(49,'2025-11-16 07:30:00','2025-11-16 09:30:00','2025-11-16 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(50,'2025-11-16 07:30:00','2025-11-23 09:30:00','2025-11-23 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(51,'2025-11-16 07:30:00','2025-11-30 09:30:00','2025-11-30 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(52,'2025-11-16 07:30:00','2025-12-07 09:30:00','2025-12-07 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(53,'2025-11-16 07:30:00','2025-12-14 09:30:00','2025-12-14 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(54,'2025-11-16 07:30:00','2025-12-21 09:30:00','2025-12-21 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(55,'2025-11-16 07:30:00','2025-12-28 09:30:00','2025-12-28 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(56,'2025-11-16 07:30:00','2026-01-04 09:30:00','2026-01-04 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(57,'2025-11-16 07:30:00','2026-01-11 09:30:00','2026-01-11 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(58,'2025-11-16 07:30:00','2026-01-18 09:30:00','2026-01-18 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(59,'2025-11-16 07:30:00','2026-01-25 09:30:00','2026-01-25 08:00:00','AVAILABLE','2025-11-16 07:30:00',1),
(60,'2025-11-16 07:30:00','2026-02-01 09:30:00','2026-02-01 08:00:00','AVAILABLE','2025-11-16 07:30:00',1);


INSERT INTO tutor_availability VALUES
(61,'2025-11-16 13:30:00','2025-11-16 16:00:00','2025-11-16 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(62,'2025-11-16 13:30:00','2025-11-23 16:00:00','2025-11-23 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(63,'2025-11-16 13:30:00','2025-11-30 16:00:00','2025-11-30 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(64,'2025-11-16 13:30:00','2025-12-07 16:00:00','2025-12-07 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(65,'2025-11-16 13:30:00','2025-12-14 16:00:00','2025-12-14 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(66,'2025-11-16 13:30:00','2025-12-21 16:00:00','2025-12-21 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(67,'2025-11-16 13:30:00','2025-12-28 16:00:00','2025-12-28 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(68,'2025-11-16 13:30:00','2026-01-04 16:00:00','2026-01-04 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(69,'2025-11-16 13:30:00','2026-01-11 16:00:00','2026-01-11 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(70,'2025-11-16 13:30:00','2026-01-18 16:00:00','2026-01-18 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(71,'2025-11-16 13:30:00','2026-01-25 16:00:00','2026-01-25 14:30:00','AVAILABLE','2025-11-16 13:30:00',1),
(72,'2025-11-16 13:30:00','2026-02-01 16:00:00','2026-02-01 14:30:00','AVAILABLE','2025-11-16 13:30:00',1);


INSERT INTO tutor_availability VALUES
(73,'2025-11-16 13:30:00','2025-11-16 16:00:00','2025-11-16 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(74,'2025-11-16 13:30:00','2025-11-23 16:00:00','2025-11-23 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(75,'2025-11-16 13:30:00','2025-11-30 16:00:00','2025-11-30 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(76,'2025-11-16 13:30:00','2025-12-07 16:00:00','2025-12-07 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(77,'2025-11-16 13:30:00','2025-12-14 16:00:00','2025-12-14 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(78,'2025-11-16 13:30:00','2025-12-21 16:00:00','2025-12-21 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(79,'2025-11-16 13:30:00','2025-12-28 16:00:00','2025-12-28 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(80,'2025-11-16 13:30:00','2026-01-04 16:00:00','2026-01-04 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(81,'2025-11-16 13:30:00','2026-01-11 16:00:00','2026-01-11 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(82,'2025-11-16 13:30:00','2026-01-18 16:00:00','2026-01-18 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(83,'2025-11-16 13:30:00','2026-01-25 16:00:00','2026-01-25 14:30:00','AVAILABLE','2025-11-16 13:30:00',2),
(84,'2025-11-16 13:30:00','2026-02-01 16:00:00','2026-02-01 14:30:00','AVAILABLE','2025-11-16 13:30:00',2);


INSERT INTO tutor_availability VALUES
(85,'2025-11-15 13:30:00','2025-11-15 16:00:00','2025-11-15 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(86,'2025-11-15 13:30:00','2025-11-22 16:00:00','2025-11-22 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(87,'2025-11-15 13:30:00','2025-11-29 16:00:00','2025-11-29 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(88,'2025-11-15 13:30:00','2025-12-06 16:00:00','2025-12-06 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(89,'2025-11-15 13:30:00','2025-12-13 16:00:00','2025-12-13 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(90,'2025-11-15 13:30:00','2025-12-20 16:00:00','2025-12-20 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(91,'2025-11-15 13:30:00','2025-12-27 16:00:00','2025-12-27 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(92,'2025-11-15 13:30:00','2026-01-03 16:00:00','2026-01-03 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(93,'2025-11-15 13:30:00','2026-01-10 16:00:00','2026-01-10 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(94,'2025-11-15 13:30:00','2026-01-17 16:00:00','2026-01-17 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(95,'2025-11-15 13:30:00','2026-01-24 16:00:00','2026-01-24 14:30:00','AVAILABLE','2025-11-15 13:30:00',2),
(96,'2025-11-15 13:30:00','2026-01-31 16:00:00','2026-01-31 14:30:00','AVAILABLE','2025-11-15 13:30:00',2);


INSERT INTO tutor_availability VALUES
(97,'2025-11-16 07:30:00','2025-11-16 09:30:00','2025-11-16 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(98,'2025-11-16 07:30:00','2025-11-23 09:30:00','2025-11-23 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(99,'2025-11-16 07:30:00','2025-11-30 09:30:00','2025-11-30 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(100,'2025-11-16 07:30:00','2025-12-07 09:30:00','2025-12-07 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(101,'2025-11-16 07:30:00','2025-12-14 09:30:00','2025-12-14 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(102,'2025-11-16 07:30:00','2025-12-21 09:30:00','2025-12-21 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(103,'2025-11-16 07:30:00','2025-12-28 09:30:00','2025-12-28 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(104,'2025-11-16 07:30:00','2026-01-04 09:30:00','2026-01-04 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(105,'2025-11-16 07:30:00','2026-01-11 09:30:00','2026-01-11 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(106,'2025-11-16 07:30:00','2026-01-18 09:30:00','2026-01-18 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(107,'2025-11-16 07:30:00','2026-01-25 09:30:00','2026-01-25 08:00:00','AVAILABLE','2025-11-16 07:30:00',2),
(108,'2025-11-16 07:30:00','2026-02-01 09:30:00','2026-02-01 08:00:00','AVAILABLE','2025-11-16 07:30:00',2);


INSERT INTO tutor_availability VALUES
(109,'2025-11-15 07:30:00','2025-11-15 09:30:00','2025-11-15 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(110,'2025-11-15 07:30:00','2025-11-22 09:30:00','2025-11-22 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(111,'2025-11-15 07:30:00','2025-11-29 09:30:00','2025-11-29 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(112,'2025-11-15 07:30:00','2025-12-06 09:30:00','2025-12-06 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(113,'2025-11-15 07:30:00','2025-12-13 09:30:00','2025-12-13 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(114,'2025-11-15 07:30:00','2025-12-20 09:30:00','2025-12-20 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(115,'2025-11-15 07:30:00','2025-12-27 09:30:00','2025-12-27 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(116,'2025-11-15 07:30:00','2026-01-03 09:30:00','2026-01-03 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(117,'2025-11-15 07:30:00','2026-01-10 09:30:00','2026-01-10 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(118,'2025-11-15 07:30:00','2026-01-17 09:30:00','2026-01-17 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(119,'2025-11-15 07:30:00','2026-01-24 09:30:00','2026-01-24 08:00:00','AVAILABLE','2025-11-15 07:30:00',2),
(120,'2025-11-15 07:30:00','2026-01-31 09:30:00','2026-01-31 08:00:00','AVAILABLE','2025-11-15 07:30:00',2);


INSERT INTO tutor_availability VALUES
(121,'2025-11-16 17:30:00','2025-11-16 20:00:00','2025-11-16 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(122,'2025-11-16 17:30:00','2025-11-23 20:00:00','2025-11-23 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(123,'2025-11-16 17:30:00','2025-11-30 20:00:00','2025-11-30 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(124,'2025-11-16 17:30:00','2025-12-07 20:00:00','2025-12-07 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(125,'2025-11-16 17:30:00','2025-12-14 20:00:00','2025-12-14 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(126,'2025-11-16 17:30:00','2025-12-21 20:00:00','2025-12-21 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(127,'2025-11-16 17:30:00','2025-12-28 20:00:00','2025-12-28 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(128,'2025-11-16 17:30:00','2026-01-04 20:00:00','2026-01-04 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(129,'2025-11-16 17:30:00','2026-01-11 20:00:00','2026-01-11 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(130,'2025-11-16 17:30:00','2026-01-18 20:00:00','2026-01-18 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(131,'2025-11-16 17:30:00','2026-01-25 20:00:00','2026-01-25 18:30:00','AVAILABLE','2025-11-16 17:30:00',2),
(132,'2025-11-16 17:30:00','2026-02-01 20:00:00','2026-02-01 18:30:00','AVAILABLE','2025-11-16 17:30:00',2);






INSERT INTO class_requests
(request_id, additional_notes, created_at, start_date, total_sessions, end_date,
 status, sessions_per_week, type, updated_at, learner_id, subject_id, tutor_id)
VALUES
(1,'','2025-12-20 18:38:33.391675','2025-12-21',1,'2025-12-21','PENDING',1,'TRIAL','2025-12-20 18:38:33.434980',1,1,1),
(3, 'Học thử lớp toán ', '2025-11-20 19:15:00.000000', '2025-11-24', 1, '2025-11-24', 'PENDING', 1, 'TRIAL','2025-11-20 19:15:00.000000', 1, 1, 1),
(4, 'Học thử đầu tháng 12', '2025-11-25 20:00:00.000000', '2025-12-01', 1, '2025-12-01', 'PENDING', 1, 'TRIAL', '2025-11-25 20:00:00.000000', 1, 1, 1);
INSERT INTO classes
(class_id, completed_sessions, status, request_id)
VALUES
(1,0,'PENDING',1),
(3, 0, 'PENDING', 3),
(4, 0, 'PENDING', 4);


INSERT INTO request_schedules
(schedule_id, created_at, day_of_week, start_time, end_time, request_id)
VALUES
(1,'2025-12-20 18:38:33.520861','SUNDAY','09:30:00.000000','08:00:00.000000',1),
(3,'2025-11-20 19:15:00.000000', 'MONDAY', '09:30:00.000000', '11:00:00.000000', 3),
(4,'2025-11-25 20:00:00.000000','MONDAY','09:30:00.000000','11:00:00.000000',4);




























INSERT INTO stickers (image_url) VALUES
('https://drive.google.com/uc?id=1RQ4pMOZdIpdwKKAYXe39kBS_E4oONLbe'),
('https://drive.google.com/uc?id=1wGJbmWAU6Pv3tuoVzaaxwb2Xr3uR8fNq'),
('https://drive.google.com/uc?id=1RkIYuo9GGISkoUqgTfN1KxBXwS5fGyIm'),
('https://drive.google.com/uc?id=1-aDcZ6lYuAC2SKMmbLZIAMad0L_2RZ4Z'),
('https://drive.google.com/uc?id=1l64efPA9I1-GgMb5pTZqeFbHT63hKQCs'),
('https://drive.google.com/uc?id=1GX2qCeVbMLVaWCmjZpEvG28nOGUSXOlh'),
('https://drive.google.com/uc?id=1my-_NSYUH6ZdVgiCZAIHP4iveCEDiiAw'),
('https://drive.google.com/uc?id=1Jw0OEmbKhQMHspNaPpFWoCXRHItpEGUf'),
('https://drive.google.com/uc?id=1AhdBRvr1puf1gdlXBbuKd0f43mmxqbPm'),
('https://drive.google.com/uc?id=1DxA-Zu6rBqd3L1zSHfEdPpG2cwpvDK-M'),
('https://drive.google.com/uc?id=1ZBCOlR6JzcPCrfsc6iSQT3feiNkCaI5p'),
('https://drive.google.com/uc?id=1XLwTFSBkIt8lb92l36zM9PnYac51xhYO'),
('https://drive.google.com/uc?id=1Y8Bk3yiYbCOrAF67iqJ8jv2BEzVOqg6w'),
('https://drive.google.com/uc?id=1bGIOHnWunjt9h0jeYsMw-lPhavQy48FY'),
('https://drive.google.com/uc?id=1x2JYs2KWSh7mtaeBb1dG-uwBZkN4OxFe'),
('https://drive.google.com/uc?id=1BD9i-hTGknUpZQTbxSWXVArc2dqdZkTt'),
('https://drive.google.com/uc?id=1UVw0EDOW5PN56vk6ijMICbEAskTR1ILJ'),
('https://drive.google.com/uc?id=1NH8iXNQ8O8T-gvWhXuPu4IVtPfcaYt1A'),
('https://drive.google.com/uc?id=1QF-LoOE4v6is1hdnr4YC70LpNTzB28tm'),
('https://drive.google.com/uc?id=1G5ky8QTN7KThOPi1MNwdL-qOetK9Aov-'),
('https://drive.google.com/uc?id=1E-dMg_QRKAXslr99IKwH6AJL38eMrYj5'),
('https://drive.google.com/uc?id=1qKf3d8ZI_3iYq3EEfTMdL32oVqVa8SB2'),
('https://drive.google.com/uc?id=1TNDAbR2cWcG7_21MKGuOi_w8A_B2jnL1'),
('https://drive.google.com/uc?id=1uIvPh94taEqYCNoQPmdmHClMZlfQfY6I'),
('https://drive.google.com/uc?id=15QNYo2M4fHJ2GG-R_X9bH3Ll4SkLYCYu'),
('https://drive.google.com/uc?id=1lOgQiDAHi1Uk0ddlqKmX1vHaJLgr6ebC'),
('https://drive.google.com/uc?id=1WkfjhX7wBbbEO0BitphGrXUjb9p0Gt9b'),
('https://drive.google.com/uc?id=1I9R75Bnlyt0WfciS96ZlQF_sjhLAe5cx'),
('https://drive.google.com/uc?id=13uXxAs-J_fiskfXbgesyHZ2B2Rl4a7xf'),
('https://drive.google.com/uc?id=13AeMP_76lcSiONrcy9VoeXUhrf5A5XZz'),
('https://drive.google.com/uc?id=1aCYPdEzruQp256SDhtb43MdFbHJRpFA3'),
('https://drive.google.com/uc?id=1StXdXiekq2ZGXSW4MBJZsN2At4w_DlXh'),
('https://drive.google.com/uc?id=1MIMyUJTOJV1RDaqw_xnm5V4ADG94Kf--'),
('https://drive.google.com/uc?id=1VpF0vFuE2xkJ-7695dKf3LlECxT5zVUS'),
('https://drive.google.com/uc?id=12jQyoifOsq796ofP06surdy91hH3ithU'),
('https://drive.google.com/uc?id=18jFtB4IRl0y6HxhNSCiNPPPdkLEy7xVF'),
('https://drive.google.com/uc?id=1ZSfC_DZcAX2sSPdh-KuJ5fdZOeHKsyBu'),
('https://drive.google.com/uc?id=1I9ZYdxktRaAA-ecHrDX9qEaUOcRBcKIO'),
('https://drive.google.com/uc?id=1CCMhuEToWB4Uzd78oDxM-P1cjNwDt3SE'),
('https://drive.google.com/uc?id=1tmNuIReDdI7Qq4AwTtISKg3AFJE4alPJ'),
('https://drive.google.com/uc?id=15-3iKq7guE9R3ktUfqV4yJlC4Uwe9fUP'),
('https://drive.google.com/uc?id=16FwNjpwdNYlG64UkVMfpRrgiY2nTALOK'),
('https://drive.google.com/uc?id=1uZBtbMW9Rcxtx4GRMA-tdf9F_Mt-SxYE'),
('https://drive.google.com/uc?id=1za3w9eyIAGxROxLp2XDftTI0HY8cak2T'),
('https://drive.google.com/uc?id=1xqzRMg9F3c3ZPZDHGKNzPpoEFtg45wCk'),
('https://drive.google.com/uc?id=1q8qdf2mAh6x0ZBy9qTrQMSBbFnnQd4xs'),
('https://drive.google.com/uc?id=1sLo1qqyTfdl2L5bnWtpnc8yaFZJO1-VH'),
('https://drive.google.com/uc?id=1NRtMLxSTIYBtbjUwF33ml3-aX9byktlQ'),
('https://drive.google.com/uc?id=1C3BQ8UlnN-DVXk0H6A5I6__6aIlG0aKV'),
('https://drive.google.com/uc?id=1K1Isrz_AR93VFlBWnjgMxFVKoScn1T8B'),
('https://drive.google.com/uc?id=1Z1kiaBFkWoLXEPLvddgMh11NJOUMmyhO'),
('https://drive.google.com/uc?id=1BA7zQgOeUgCPPVii86miaKoFHRHHiX4q'),
('https://drive.google.com/uc?id=1CK3PxJF7EsFOjvfKwTx5XdddQ7HRETz2'),
('https://drive.google.com/uc?id=1rhat0mee7603ol2LjQsMKauyNFkDgTUR'),
('https://drive.google.com/uc?id=1A8JxpYc7Cg3f3I_RK2E_001UahK0f-lG'),
('https://drive.google.com/uc?id=1OLJ-fg4eBKCZhNmp-zvKeIL5DaCBF_3-'),
('https://drive.google.com/uc?id=1qF1OWITvAmAM67lPN1q8BOUdl4wvbsQu'),
('https://drive.google.com/uc?id=1vIVPVcDXojXX_vKA9fGIeP6NSdGQy7c7'),
('https://drive.google.com/uc?id=1Cdb5ZHiKnjVftqN4XVEOl8eDuA1FbG8F'),
('https://drive.google.com/uc?id=1tSfLJdmxnW87TxGatLb65JT-UEYoXmrg'),
('https://drive.google.com/uc?id=1Bqukzz4E1Cepizkj7eS4dve2BVFs7_zm'),
('https://drive.google.com/uc?id=1Xkc1oL0FTKSB_eK2z00Ty4GVwDbGIh5v'),
('https://drive.google.com/uc?id=1ENLf-Ro4KI8kXuboIHYPpM8XuS3C6vvX'),
('https://drive.google.com/uc?id=100jbTy-mOsQ-VuZxT6mob4Z1esOCCJcw'),
('https://drive.google.com/uc?id=1JoVtciQ2CVbsGojTuBjEFFhFZZC44UbA'),
('https://drive.google.com/uc?id=1UMbPgUoANcH2Dr3befTctc5EQX8bXeR1'),
('https://drive.google.com/uc?id=1f-CT4Kww4bD7tf4QGMSImEwYYDjwL8EU'),
('https://drive.google.com/uc?id=11Mbpd-Qj7GlcU35aZsJo0QLmFDShP5q0'),
('https://drive.google.com/uc?id=1-rEg0GPK-nFbnaeaQAVwfkEDMqjAtBT5'),
('https://drive.google.com/uc?id=1i2FKBrrxKSMgDVIrkQ_t-Y-9QWe_5YN_'),
('https://drive.google.com/uc?id=1XvJAzXk9oDHcjp3fRtX_7P-aFRnk-S2E'),
('https://drive.google.com/uc?id=1e_gXh9TdcXlQYAEhgpDqoIWIvKNBW1w0'),
('https://drive.google.com/uc?id=14snT_FsPtRNAYj3jeMLWdVC6KdKwTR_a'),
('https://drive.google.com/uc?id=1Jzui2_KsCRci6o_CLkcsSOZaClnG7glj'),
('https://drive.google.com/uc?id=1ayD3tlDPGtHgk4X3IIi97va6Zs2cAPqE'),
('https://drive.google.com/uc?id=15vSqC7QA9gB8PTCZeiK5tBS4nwwV7iX7'),
('https://drive.google.com/uc?id=1U6Ehe3Ur5t0eVQfesNFGHh9_PZ9SKxpM'),
('https://drive.google.com/uc?id=1Lnf_yjbA8KCoHLVT7RDXl0cWT-1JMcfn'),
('https://drive.google.com/uc?id=1PoDTY6eQd2L_hvxz8-FLL7PJcjgYHrMT'),
('https://drive.google.com/uc?id=1XA4t2KtUpvdRGt9A38cN4qZ4fPNwXyOw'),
('https://drive.google.com/uc?id=1qwa1pWcJt1SKF9O4dTNBBc2atviC7EAu'),
('https://drive.google.com/uc?id=13n9aRfo1pqP2xQNU698SSEPfPpc5iZbn'),
('https://drive.google.com/uc?id=1q44Wg_GFyhl6jAzkIvN8pefPtfdEgnGv'),
('https://drive.google.com/uc?id=1pFPbCrgWUKzZY2DVVkfDky8B4ifzITWj'),
('https://drive.google.com/uc?id=1ZIdyQIZ9GYNEIn_qri_Dvj7cxdzNt_R3'),
('https://drive.google.com/uc?id=1QOwFbANvVHGq6_O8Djk6DVcKrDFNqelO'),
('https://drive.google.com/uc?id=1KEfThp7VORNdqxN1qnwgvYnk7DAir9Zv'),
('https://drive.google.com/uc?id=1faD7er4Gw8Nyj6IXadZ8P6L_p_3B5QoD'),
('https://drive.google.com/uc?id=1T44q0Q3wg0-CR6HY5Z-qB4xWBqyw13Vv'),
('https://drive.google.com/uc?id=105mbm0ZV6xao5suvoQZLo0AoGSehI-Sz'),
('https://drive.google.com/uc?id=1ccGe2sG5FtMe6dGzdTtbz0DG-j4n_Ww-'),
('https://drive.google.com/uc?id=1EWjv9zURwAEEhisM8a3LxbL1OUhE-lpO'),
('https://drive.google.com/uc?id=11Z__sBgUfpRuccuwcBvMIZWFPSWJQgaM'),
('https://drive.google.com/uc?id=1mQCwUqWAn9rccMQzmz4hHJBKcujmwNWb'),
('https://drive.google.com/uc?id=1M4qthKyBdwZBxmeH_Q06reNcm9wa7qsl'),
('https://drive.google.com/uc?id=1_J_it9VBgZTxi2jS3q0vIOtXxakASbdx'),
('https://drive.google.com/uc?id=15gkMkYPRDk2s4tKhgv4XtBs3Rma9ONvi'),
('https://drive.google.com/uc?id=1mrCZZXcWpodLroJA2BVyOWjJQP90nnv-'),
('https://drive.google.com/uc?id=19s6y6xVTupSrR5Q6Zz23M91AXxZECUhv'),
('https://drive.google.com/uc?id=1IoB7EHzZcMopth4NUO5CFiwaNMYimqrz'),
('https://drive.google.com/uc?id=1_qlYF0JywANytTr9tNK6_7U3k4QPTIqm'),
('https://drive.google.com/uc?id=1OmLX2VmD_E6QBt10-NfW9x4GD8gVG4AW'),
('https://drive.google.com/uc?id=17Db9CcJC5yOxRgTTxkBVu9_up73qLbTD'),
('https://drive.google.com/uc?id=1Iqvl_5Wq1s3FkDuRPoGxwBV156a9yrRS'),
('https://drive.google.com/uc?id=1sKMidstXQHlDBzjp4o3VXCb6fWIAF5Ss'),
('https://drive.google.com/uc?id=1rpE9v86UO-bm2V67PGpDxd5OlENBlvqy'),
('https://drive.google.com/uc?id=1mBjiYUOJ-YK9zs0hNPbAy209lHTEoArF'),
('https://drive.google.com/uc?id=1p2vkOJWzUccqpDFsCm3DJ6PAGDvsUrKI'),
('https://drive.google.com/uc?id=1AIHnmIr6nFXhAORh8z8NPYyD06kZNgd3'),
('https://drive.google.com/uc?id=1t_F_v-Um6OALGao7PdozD6vSBh2aZp8x'),
('https://drive.google.com/uc?id=1MJFjm-388iDq37gLB7JiuvZoKC5SJbkY');



INSERT INTO chat_messages 
(sender_id, receiver_id, sticker_id, content, sent_at, is_read)
VALUES
-- Learner mở đầu cuộc trò chuyện
(5, 2, NULL, 'Chào thầy, em muốn hỏi về lịch học Toán lớp 9.', 
 '2025-12-10 19:05:00', TRUE),

-- Tutor trả lời
(2, 5, NULL, 'Chào em, thầy hiện đang rảnh tối thứ 2, 4 và 6.', 
 '2025-12-10 19:07:00', TRUE),

-- Learner hỏi thêm chi tiết
(5, 2, NULL, 'Dạ học phí một buổi khoảng bao nhiêu ạ?', 
 '2025-12-10 19:08:30', TRUE),

-- Tutor trả lời học phí
(2, 5, NULL, 'Học phí là 220.000đ / buổi, mỗi buổi 90 phút.', 
 '2025-12-10 19:10:00', TRUE),

-- Learner gửi sticker đồng ý
(5, 2, 1, NULL, 
 '2025-12-10 19:10:20', TRUE),

-- Tutor xác nhận
(2, 5, NULL, 'Nếu em đồng ý, thầy sẽ tạo lịch học chính thức cho mình.', 
 '2025-12-10 19:12:00', FALSE);


INSERT INTO chat_messages
(sender_id, receiver_id, sticker_id, content, sent_at, is_read)
VALUES
-- ===== NGÀY 1: TÌM HIỂU BAN ĐẦU =====
(5, 2, NULL, 'Chào thầy, em muốn tìm gia sư Toán cho em trai lớp 9.', 
 '2025-12-10 19:05:00', TRUE),

(2, 5, NULL, 'Chào em, thầy đang dạy Toán lớp 9 và lớp 10.', 
 '2025-12-10 19:07:00', TRUE),

(5, 2, NULL, 'Dạ em muốn học để chuẩn bị thi vào lớp 10 ạ.', 
 '2025-12-10 19:08:30', TRUE),

(2, 5, NULL, 'Rất phù hợp, thầy có giáo trình luyện thi riêng.', 
 '2025-12-10 19:10:00', TRUE),

(5, 2, NULL, 'Thầy cho em hỏi học phí và thời lượng mỗi buổi được không ạ?', 
 '2025-12-10 19:11:30', TRUE),

(2, 5, NULL, '220.000đ/buổi, mỗi buổi 90 phút em nhé.', 
 '2025-12-10 19:13:00', TRUE),

-- ===== NGÀY 2: THỐNG NHẤT LỊCH =====
(5, 2, NULL, 'Dạ lịch học thì mình học mấy buổi một tuần ạ?', 
 '2025-12-11 20:00:00', TRUE),

(2, 5, NULL, 'Thường là 2–3 buổi/tuần, tùy khả năng tiếp thu của học sinh.', 
 '2025-12-11 20:02:00', TRUE),

(5, 2, NULL, 'Dạ em muốn học 3 buổi/tuần cho nhanh tiến bộ.', 
 '2025-12-11 20:03:30', TRUE),

(2, 5, NULL, 'Được em, mình có thể học tối thứ 2, 4 và 6.', 
 '2025-12-11 20:05:00', TRUE),

(5, 2, 1, NULL, 
 '2025-12-11 20:05:20', TRUE),

-- ===== NGÀY 3: XÁC NHẬN CHÍNH THỨC =====
(5, 2, NULL, 'Dạ vậy tuần sau mình bắt đầu được không thầy?', 
 '2025-12-12 18:45:00', TRUE),

(2, 5, NULL, 'Được em, thầy sẽ tạo lớp học chính thức trên hệ thống.', 
 '2025-12-12 18:47:00', TRUE),

(5, 2, NULL, 'Dạ em cảm ơn thầy nhiều ạ.', 
 '2025-12-12 18:48:30', TRUE),

-- ===== NGÀY 5: SAU BUỔI HỌC ĐẦU =====
(2, 5, NULL, 'Hôm nay em học khá tốt, cần luyện thêm phần phương trình.', 
 '2025-12-14 21:15:00', TRUE),

(5, 2, NULL, 'Dạ em thấy bài này hơi khó, thầy cho em thêm bài tập nhé.', 
 '2025-12-14 21:17:00', TRUE),

(2, 5, NULL, 'Ok em, thầy sẽ gửi thêm bài tập sau buổi học.', 
 '2025-12-14 21:18:30', TRUE),

-- ===== NGÀY 7: TIN NHẮN CHƯA ĐỌC (TEST REALTIME) =====
(2, 5, NULL, 'Ngày mai mình học sớm hơn 30 phút được không em?', 
 '2025-12-16 19:30:00', FALSE);


INSERT INTO chat_messages
(sender_id, receiver_id, sticker_id, content, is_read, sent_at)
VALUES
-- =========================
-- Cuộc trò chuyện: user 6 ↔ user 2
-- =========================
(6, 2, NULL, 'Chào thầy, em muốn hỏi về lịch học Toán ạ.', b'0', '2025-12-12 18:30:00'),
(2, 6, NULL, 'Chào em, hiện tại thầy trống tối thứ 2 và thứ 4.', b'1', '2025-12-12 18:32:00'),
(6, 2, NULL, 'Dạ, tối thứ 4 học từ mấy giờ vậy thầy?', b'0', '2025-12-12 18:33:30'),
(2, 6, NULL, 'Từ 18:30 đến 20:00 em nhé.', b'1', '2025-12-12 18:35:00'),
(6, 2, 1, NULL, b'1', '2025-12-12 18:36:00'),   
(2, 6, 3, NULL, b'1', '2025-12-12 18:36:30'),   

-- =========================
-- Cuộc trò chuyện: user 7 ↔ user 2
-- =========================
(7, 2, NULL, 'Thầy ơi, em muốn đăng ký học Lý lớp 12.', b'0', '2025-12-13 19:00:00'),
(2, 7, NULL, 'Chào em, thầy có thể dạy Lý vào tối thứ 3 và thứ 5.', b'1', '2025-12-13 19:02:00'),
(7, 2, NULL, 'Dạ, lịch đó phù hợp với em ạ.', b'1', '2025-12-13 19:03:00'),
(2, 7, NULL, 'Vậy thầy sẽ tạo lớp học cho em nhé.', b'1', '2025-12-13 19:04:30'),
(7, 2, 4, NULL, b'1', '2025-12-13 19:05:00'),   
(2, 7, 5, NULL, b'1', '2025-12-13 19:05:30');   
