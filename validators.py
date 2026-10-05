import re
from decimal import Decimal, InvalidOperation
from datetime import datetime


def validate_email(email):
    """
    Validate weather an email adderess has a valid basic format.

    Input email(str): Email address to validate.

    O/P : bool : True if valid, False otherwise.

    Regex = pattern matching

    and learn the commonly used symbols:

    ^       start
    $       end
    +       one or more
    *       zero or more
    ?       optional
    \d      digit
    \w      word character
    \s      whitespace
    \.      actual dot
    []      character choices


    """
    email = email.strip().lower()
    pattern = re.compile(r"^[\w\.-]+@[\w\.-]+\.\w+$")
    return pattern.fullmatch(email) is not None


def validate_phone(phone):
    """
    Validate an INdian phone mumber.

    Input

    """
    phone = phone.replace(" ", "").replace("-", "")

    if phone.startwith("+91"):
        phone = phone.replace("+91", "", 1)

    return phone.isdigit() and len(phone) == 10


def validate_amount(amount):
    try:
        amount = Decimal(amount)
    except (InvalidOperation, ValueError, TypeError):
        return False

    return amount >= 0


def validate_date(date_text):
    try:
        datetime.strptime(date_text.strip(), "%d-%m-%Y")
        return True
    except ValueError:
        return False


def validdate_not_empty(value):
    return len(value.strip()) > 0
