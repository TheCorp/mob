DELIMITER $$
DROP TRIGGER IF EXISTS empprofile_insert;
CREATE TRIGGER empprofile_insert AFTER INSERT ON profile
	FOR EACH ROW 
	BEGIN
		DECLARE roleid INTEGER;
		DECLARE city VARCHAR(100);
		DECLARE keyrows INTEGER;
		SELECT count(*) INTO roleid FROM user_role r WHERE r.user_id=NEW.user_id and r.role_id=2;
		IF roleid>0 THEN
			SELECT u.city INTO city FROM user u, profile p where p.user_id=u.id and p.id=NEW.id;
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=2;
			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like city  and i.itemType=2;
			ELSE
				IF city != '' THEN
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (2,city,1);
				END IF;
			END IF;
		END IF;
	END$$


/////////////// Employee Education//////////////////////////////
DROP TRIGGER IF EXISTS emp_education_insert;
CREATE TRIGGER emp_education_insert AFTER INSERT ON education
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		IF NEW.degree != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.degree  and i.itemType=1;
			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.degree  and i.itemType=1;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (1,NEW.degree,1);
			END IF;
		END IF;
	END$$



DROP TRIGGER IF EXISTS emp_education_update;
CREATE TRIGGER emp_education_update AFTER UPDATE ON education
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		DECLARE itemrows INTEGER;

		IF OLD.degree!=NEW.degree THEN
			UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.degree;
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.degree  and i.itemType=1;
			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.degree  and i.itemType=1;
			ELSE
				IF NEW.degree != '' THEN
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (1,NEW.degree,1);
				END IF;
			END IF;
		END IF;
	END$$

DROP TRIGGER IF EXISTS emp_education_delete;
CREATE TRIGGER emp_education_delete AFTER DELETE ON education
	FOR EACH ROW 
	BEGIN
		DECLARE itemrows INTEGER;
		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.degree  and i.itemType=1;
	END$$

//////////////// Employee Location ///////////////////
DROP TRIGGER IF EXISTS emp_location_insert;
CREATE TRIGGER emp_location_insert AFTER INSERT ON user_role
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		DECLARE city VARCHAR(50);
		DECLARE procount INTEGER;
		
		IF NEW.role_id=1 THEN
			SELECT u.city INTO city FROM user u WHERE u.id=NEW.user_id;
			IF city!='' THEN
				SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=5;

				IF keyrows>0 THEN
					UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like city and i.itemType=5;
				ELSE
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (5,city,1);
				END IF;
			END IF;
		END IF;

	END$$

DROP TRIGGER IF EXISTS emp_location_update;
CREATE TRIGGER emp_location_update BEFORE UPDATE ON user
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		DECLARE itemrows INTEGER;
		DECLARE emprows INTEGER;
		DECLARE roleid BIGINT;
		DECLARE procount INTEGER;
		SELECT count(*) INTO roleid FROM user_role r WHERE r.user_id=NEW.id and r.role_id=2;
		IF roleid>0 THEN
			IF OLD.city!=NEW.city THEN
				SELECT count(*) INTO procount FROM profile WHERE user_id=OLD.id;
				UPDATE itemcount i SET i.count=i.count-procount WHERE  i.searchTerm like OLD.city and i.itemType=2;

				SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.city  and i.itemType=2;
				SELECT count(*) INTO procount FROM profile WHERE user_id=OLD.id;
				IF keyrows>0 THEN
					UPDATE itemcount i SET i.count=i.count+procount WHERE  i.searchTerm like NEW.city  and i.itemType=2;
				ELSE
					IF NEW.city != '' THEN
						INSERT INTO itemcount (itemType, searchTerm, count) VALUES (2,NEW.city,procount);
					END IF;
				END IF;
			END IF;
		END IF;

		IF roleid<=0 THEN
			IF OLD.city!=NEW.city THEN
				UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.city and i.itemType=5;
				SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.city  and i.itemType=5;
				IF keyrows>0 THEN
					UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.city  and i.itemType=5;
				ELSE
					SELECT count(*) INTO emprows FROM user_role r WHERE r.user_id=NEW.id and r.role_id=1;
					IF emprows=0 THEN
						IF NEW.city != '' THEN
							INSERT INTO itemcount (itemType, searchTerm, count) VALUES (5,NEW.city,1);
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
	END$$

DROP TRIGGER IF EXISTS emp_location_delete;
CREATE TRIGGER emp_location_delete BEFORE DELETE ON user
	FOR EACH ROW 
	BEGIN
		DECLARE itemrows INTEGER;
		DECLARE roleid BIGINT;
		DECLARE procount INTEGER;
		SELECT count(*) INTO roleid FROM user_role r WHERE r.user_id=OLD.id and r.role_id=2;
		IF roleid>0 THEN
			SELECT count(*) INTO procount FROM profile WHERE user_id=OLD.id;
			UPDATE itemcount i SET i.count=i.count-procount WHERE  i.searchTerm like OLD.city and i.itemType=2;
		END IF;
		
		IF roleid<=0 THEN
			UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.city and i.itemType=5;
		END IF;
	END$$

//////////////// Employee Location ///////////////////

//////////////// Employee Skills ///////////////////
DROP TRIGGER IF EXISTS emp_skills_insert;
CREATE TRIGGER emp_skills_insert AFTER INSERT ON userskills
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;

		IF NEW.skillname != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.skillname  and i.itemType=3;
			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.skillname  and i.itemType=3;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (3,NEW.skillname,1);
			END IF;
		END IF;
	END$$

DROP TRIGGER IF EXISTS emp_skills_update;
CREATE TRIGGER emp_skills_update AFTER UPDATE ON userskills
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		DECLARE itemrows INTEGER;

		IF OLD.skillname!=NEW.skillname THEN
			UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.skillname;
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.skillname  and i.itemType=3;
			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like NEW.skillname  and i.itemType=3;
			ELSE
				IF NEW.skillname != '' THEN
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (3,NEW.skillname,1);
				END IF;
			END IF;
		END IF;
	END$$

DROP TRIGGER IF EXISTS emp_skills_delete;
CREATE TRIGGER emp_skills_delete AFTER DELETE ON userskills
	FOR EACH ROW 
	BEGIN
		DECLARE itemrows INTEGER;
		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like OLD.skillname  and i.itemType=3;
	END$$

//////////////// Employee Skills ///////////////////

//////////////// Employer Industry ///////////////////

DROP TRIGGER IF EXISTS empr_industry_insert;
CREATE TRIGGER empr_industry_insert AFTER INSERT ON employer
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		DECLARE ind VARCHAR(250);

		SELECT i.name INTO ind FROM industry i WHERE i.id=NEW.industry_id;

		IF ind != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like ind  and i.itemType=4;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like ind and i.itemType=4;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (4,ind,1);
			END IF;
		END IF;
	END$$

DROP TRIGGER IF EXISTS empr_industry_update;
CREATE TRIGGER empr_industry_update AFTER UPDATE ON employer
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		DECLARE ind VARCHAR(250);
		DECLARE oldind VARCHAR(250);

		IF NEW.industry_id!=OLD.industry_id THEN
			SELECT i.name INTO oldind FROM industry i WHERE i.id=OLD.industry_id;
			UPDATE itemcount i SET i.count=i.count-1 WHERE i.searchTerm like oldind and itemType=4;
			
			SELECT i.name INTO ind FROM industry i WHERE i.id=NEW.industry_id;
			
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like ind  and i.itemType=4;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like ind and i.itemType=4;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (4,ind,1);
			END IF;
		END IF;
	END$$

DROP TRIGGER IF EXISTS empr_industry_delete;
CREATE TRIGGER empr_industry_delete AFTER DELETE ON employer
	FOR EACH ROW 
	BEGIN
		DECLARE ind VARCHAR(250);
		SELECT i.name INTO ind FROM industry i WHERE i.id=OLD.industry_id;

		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like ind  and i.itemType=4;
	END$$
//////////////// Employer Industry ///////////////////

//////////////// Employer Location ///////////////////

DROP TRIGGER IF EXISTS empr_location_insert;

DROP TRIGGER IF EXISTS empr_location_update;

DROP TRIGGER IF EXISTS empr_location_delete;

//////////////// Employer Location ///////////////////

//////////////// Group Location ///////////////////

DROP TRIGGER IF EXISTS group_location_insert;
CREATE TRIGGER group_location_insert AFTER INSERT ON mobgroup
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		DECLARE city VARCHAR(250);

		SELECT u.city INTO city FROM mobgroup g, profile p, user u WHERE g.id=NEW.id and p.id=g.profile_id and p.user_id=u.id;

		IF city != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=7;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like city and i.itemType=7;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (7,city,1);
			END IF;
		END IF;
	END$$

DROP TRIGGER IF EXISTS group_location_update;
CREATE TRIGGER group_location_update AFTER UPDATE ON mobgroup
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		DECLARE city VARCHAR(250);
		DECLARE oldcity VARCHAR(250);

		IF NEW.profile_id!=OLD.profile_id THEN

			SELECT u.city INTO oldcity FROM mobgroup g, profile p, user u WHERE g.id=OLD.id and p.id=g.profile_id and p.user_id=u.id;

			IF city != '' THEN
				SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=7;
				UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like oldcity and i.itemType=7;

				SELECT u.city INTO city FROM mobgroup g, profile p, user u WHERE g.id=NEW.id and p.id=g.profile_id and p.user_id=u.id;
				IF keyrows>0 THEN
					UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like city and i.itemType=7;
				ELSE
					INSERT INTO itemcount (itemType, searchTerm, count) VALUES (7,city,1);
				END IF;
			END IF;
		END IF;
	END$$

DROP TRIGGER IF EXISTS group_location_delete;
CREATE TRIGGER group_location_delete AFTER DELETE ON mobgroup
	FOR EACH ROW 
	BEGIN
		DECLARE oldcity VARCHAR(250);

		SELECT u.city INTO oldcity FROM mobgroup g, profile p, user u WHERE g.id=OLD.id and p.id=g.profile_id and p.user_id=u.id;
		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like oldcity and i.itemType=7;
	END$$

//////////////// Group Location ///////////////////

//////////////// Opportunity Industry ///////////////////
DROP TRIGGER IF EXISTS opp_industryloc_insert;
CREATE TRIGGER opp_industryloc_insert AFTER INSERT ON opportunity
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		DECLARE ind VARCHAR(250);
		DECLARE city VARCHAR(50);

		SELECT i.name INTO ind FROM opportunity o, employerprofile p, employer e, industry i WHERE o.id=NEW.id and o.employer_profileid=p.profile_id and p.user_id=e.user_id and e.industry_id=i.id;

		IF ind != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like ind  and i.itemType=9;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like ind and i.itemType=9;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (9,ind,1);
			END IF;
		END IF;

		SELECT u.city INTO city FROM opportunity o, employerprofile p, user u WHERE o.id=NEW.id and o.employer_profileid=p.profile_id and p.user_id=u.id;

		IF city != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=10;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like city and i.itemType=10;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (10,city,1);
			END IF;
		END IF;

		SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.salary_range  and i.itemType=11;

		IF keyrows>0 THEN
			UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like  NEW.salary_range and i.itemType=11;
		ELSE
			INSERT INTO itemcount (itemType, searchTerm, count) VALUES (11, NEW.salary_range,1);
		END IF;

	END$$

DROP TRIGGER IF EXISTS opp_sal_update;
CREATE TRIGGER opp_sal_update AFTER UPDATE ON opportunity
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		IF NEW.salary_range != OLD.salary_range THEN
			UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like  OLD.salary_range and i.itemType=11;

			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.salary_range  and i.itemType=11;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like  NEW.salary_range and i.itemType=11;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (11, NEW.salary_range,1);
			END IF;
		END IF;		
	END$$

DROP TRIGGER IF EXISTS opp_industryloc_delete;
CREATE TRIGGER opp_industryloc_delete AFTER DELETE ON opportunity
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		DECLARE ind VARCHAR(250);
		DECLARE city VARCHAR(50);

		SELECT i.name INTO ind FROM opportunity o, employerprofile p, employer e, industry i WHERE o.id=OLD.id and o.employer_profileid=p.profile_id and p.user_id=e.user_id and e.industry_id=i.id;

		IF ind != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like ind  and i.itemType=9;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like ind and i.itemType=9;
			END IF;
		END IF;

		SELECT u.city INTO city FROM opportunity o, employerprofile p, user u WHERE o.id=OLD.id and o.employer_profileid=p.profile_id and p.user_id=u.id;

		IF city != '' THEN
			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like city  and i.itemType=10;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like v and i.itemType=10;
			END IF;
		END IF;

		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like  OLD.salary_range and i.itemType=11;

	END$$

DROP TRIGGER IF EXISTS opp_industryloc_insert;
CREATE TRIGGER opp_industryloc_insert AFTER INSERT ON opportunity_skills
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.skillNeeded  and i.itemType=12;

		IF keyrows>0 THEN
			UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like  NEW.skillNeeded and i.itemType=12;
		ELSE
			INSERT INTO itemcount (itemType, searchTerm, count) VALUES (12, NEW.skillNeeded,1);
		END IF;
		
	END$$

DROP TRIGGER IF EXISTS opp_sal_update;
CREATE TRIGGER opp_sal_update AFTER UPDATE ON opportunity_skills
	FOR EACH ROW 
	BEGIN
		DECLARE keyrows INTEGER;
		IF NEW.skillNeeded != OLD.skillNeeded THEN
			UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like  OLD.skillNeeded and i.itemType=12;

			SELECT count(*) INTO keyrows FROM itemcount i WHERE i.searchTerm like NEW.skillNeeded  and i.itemType=12;

			IF keyrows>0 THEN
				UPDATE itemcount i SET i.count=i.count+1 WHERE  i.searchTerm like  NEW.skillNeeded and i.itemType=12;
			ELSE
				INSERT INTO itemcount (itemType, searchTerm, count) VALUES (12, NEW.skillNeeded,1);
			END IF;
		END IF;		
	END$$


DROP TRIGGER IF EXISTS opp_sal_delete;
CREATE TRIGGER opp_sal_delete AFTER DELETE ON opportunity_skills
	FOR EACH ROW 
	BEGIN
		UPDATE itemcount i SET i.count=i.count-1 WHERE  i.searchTerm like  OLD.skillNeeded and i.itemType=12;
	END$$