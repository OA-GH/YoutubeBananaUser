--SIGN UP--
CREATE OR REPLACE FUNCTION public.signup_user (_user_name varchar(255) = NULL, _email varchar(255) = NULL, _password varchar(255) = NULL)
RETURNS VOID
AS
$BODY$
BEGIN
INSERT INTO public.app_user(
        user_name,
        email,
        password
)values(
    _user_name,
    _email,
    _password
);
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--LOGIN--
CREATE OR REPLACE FUNCTION public.login_user (_email varchar(255)=NULL,_password varchar(255)=NULL)
RETURNS refcursor AS
$BODY$
DECLARE
ref refcursor;
BEGIN
OPEN ref FOR SELECT * FROM app_user
             WHERE email = _email
                AND password = _password;
                RETURN ref;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--DELETE--
CREATE OR REPLACE FUNCTION public.delete_user (_id INT = NULL)
RETURNS VOID AS
$BODY$
BEGIN
DELETE FROM app_user
WHERE id = _id;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

--CHANGE PASSWORD--
CREATE OR REPLACE FUNCTION public.change_password_user (_id INT=NULL,_password varchar(255)=NULL)
RETURNS VOID
AS
$BODY$
BEGIN
UPDATE app_user
SET password = _password
WHERE id = _id;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;