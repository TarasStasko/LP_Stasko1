def my_map(func, lst):
    result = []
    for item in lst:
        result.append(func(item))
    return result


class Maybe:
    def __init__(self, value, is_just=True):
        self.value = value
        self.is_just = is_just

    def __repr__(self):
        if self.is_just:
            return f"Just({self.value})"
        else:
            return "Nothing"

def just(value):
    return Maybe(value, True)

def nothing():
    return Maybe(None, False)

def maybe_fmap(func, maybe_val):
    if maybe_val.is_just:
        return just(func(maybe_val.value))
    else:
        return nothing()

maybe_number = just(5)
mapped_maybe_number = maybe_fmap(lambda x: x * 2, maybe_number)
print("maybe_fmap result for just(5):", mapped_maybe_number)

maybe_list = just([1, 2, 3])
mapped_maybe_list = maybe_fmap(lambda lst: my_map(lambda x: x + 1, lst), maybe_list)
print("maybe_fmap result for just([1,2,3]):", mapped_maybe_list)
