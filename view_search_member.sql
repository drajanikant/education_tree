use education_tree;
create view view_search_member as
SELECT member_college_id, vc.member_id, college_id, year_of_passing, college_type, college_name,  member_name, member_dob, member_gender, member_email, member_mobile, education_type, job_type, company_name FROM view_member_college vc, member m 
where vc.member_id=m.member_id
;