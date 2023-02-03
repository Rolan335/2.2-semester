# import random


# def y_func(x):
#     return (x ^ 2 + 2 * x + 1)


# def get_1k(x_min, x_max):
#     x_out = []

#     for i in range(0, 10):
#         x_out.append(y_func(random.randint(x_min, x_max)))
#     return x_out

#     random.seed()


# # 1(a)
# def foo(a):
#     ind = 0
#     for i in range(len(a), 0, -1):

#         for j in range(1, i):
#             if a[j - 1] > a[j]:
#                 a[j - 1], a[j] = a[j], a[j - 1]
#             ind += 1
#         ind += 1
#     print(ind)
#     return a


# a = get_1k(10, 10000)
# foo(a)

# # 1(b)

# def Foo(arr):
#     ind = 0
#     for i in range(1, len(arr)):
#         temp = arr[i]

#         j = i - 1
#         ind += 1

#         while j >= 0 and temp < arr[j]:
#             arr[j + 1] = arr[j]
#             j -= 1
#             ind += 1

#         arr[j + 1] = temp
#     print(ind)

# ar = get_1k(10, 10000)
# Foo(ar)
