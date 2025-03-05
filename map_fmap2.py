def my_map(func, lst):
    result = []
    for item in lst:
        result.append(func(item))
    return result


def fmap(pred, term):

    try:
        transformed = pred(term)
    except Exception:
        transformed = term

    if transformed != term:
        return transformed

    if isinstance(term, list):
        return [fmap(pred, item) for item in term]
    if isinstance(term, tuple):
        return tuple(fmap(pred, item) for item in term)
    if isinstance(term, dict):
        return {k: fmap(pred, v) for k, v in term.items()}

    return term

example = [1, 2, [3, 4], {"a": 5, "b": [6, 7]}, "hello"]
result = fmap(lambda x: x + 3, example)
print("fmap result:", result)
