def format_currency(amount, symbol="$"):
    """
    format the amount as currency with the symbol, thousands separators,and
    two decimal places.

    eg : format_currency(5463573)

    # $ 5,463,573.00

    """

    return f"{symbol}{amount:,.2f}"


def calculate_total(*amounts):
    """
    calculate the total of multiple amounts
    Example: calculate_total(100, 250, 50)
    400
    """
    total = 0

    for amount in amounts:
        total += amount

    return total


def build_filter(**criteria):
    """
    Build a SQL WHERE Clause and parameter tuple from filter criteria.

    """

    allowed_fields = [
        "client_id",
        "title",
        "billing_type",
        "status",
        "start_date",
        "deadline",
    ]

    clauses = []
    params = []

    for key, value in criteria.items():
        if key not in allowed_fields:
            raise ValueError(f"Invalid filter field: {key}")

        clauses.append(f"{key} = %s")
        params.append(value)

    clause_string = " AND ".join(clauses)
    return clause_string, tuple(params)


def sort_records(records, key):
    """
    sort a list of dictionaries or records using a specific key.

    """

    return sorted(records, key=lambda record: record[key])


def category_path(category_id, categories):
    """
    Build a complete path of a category from its parent hierarchy.

    Example:
        categories = {
            1: {"name": "Electronics", "parent_id": None},
            2: {"name": "Mobiles", "parent_id": 1},
            3: {"name": "Android", "parent_id": 2}
        }


    """

    category = categories[category_id]

    if category["parent_id"] is None:
        return category["name"]

    parent_path = category_path(category["parent_id"], categories)

    return parent_path + " > " + category["name"]


def generate_invoice_number(last_number, year):
    """
    generate the next invoice number"""
