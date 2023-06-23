# Listing 6.1
from django import forms


# class UserForm(forms.Form):
#     name = forms.CharField(label='Имя клиента')
#     age = forms.IntegerField(label='Возраст клиента')
#
# from django import forms
# class UserForm(forms.Form):
#     basket = forms.BooleanField(label="Положить товар в корзину")

# from django import forms
# class UserForm(forms.Form):
#     basket = forms.BooleanField(label="Положить в корзину", required=False)

# from django import forms
# class UserForm(forms.Form):
#     vyb = forms.NullBooleanField(label="Вы поедете в Сочи этим летом?")

# from django import forms
# class UserForm(forms.Form):
#    name = forms.CharField(label="Имя клиента")

# from django import forms
# class UserForm(forms.Form):
#    email = forms.EmailField(label="Электронный адрес", help_text="Обязательный символ - @")

# from django import forms
# class UserForm(forms.Form):
#    ip_adres = forms.GenericIPAddressField(label="IP адрес", help_text=" Пример формата 192.0.2.0")

# from django import forms
# class UserForm(forms.Form):
#    reg_text = forms.RegexField(label="Текст", regex="^[0-9][A-F][0-9]$")

# from django import forms
# class UserForm(forms.Form):
#    slug_text = forms.SlugField(label="Введите текст")

# from django import forms
# class UserForm(forms.Form):
#    url_text = forms.URLField(label="Введите URL", help_text="Например http://www.google.com")

# Listing 6.19
# from django import forms
# class UserForm(forms.Form):
#    uuid_text = forms.UUIDField(label="Введите UUID", help_text="Формат xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")


# Listing 6.20
# from django import forms
# class UserForm(forms.Form):
#    combo_text = forms.ComboField(label="Введите URL",
#                                 fields=[forms.URLField(), forms.CharField(max_length=20)])

# Listing 6.21
# from django import forms
# class UserForm(forms.Form):
#     file_path = forms.FilePathField(label="Выберите файл", path="C:/Python37/")

# Listing 6.22
from django import forms
class UserForm(forms.Form):
    file_path = forms.FilePathField(label="Выберите файл", path="C:/Users/buldo/Desktop/2.2 semester",
                                    allow_files="True", allow_folders="True")

# Listing 6.23
from django import forms
class UserForm(forms.Form):
    file = forms.FileField(label="Файл")

# Listing 6.24
from django import forms
class UserForm(forms.Form):
    file = forms.ImageField(label="Изображение")

from django import forms
class UserForm(forms.Form):
    date = forms.DateField(label="Введите дату")

from django import forms
class UserForm(forms.Form):
    time = forms.DateField(label="Введите время")

from django import forms
class UserForm(forms.Form):
    date_time = forms.DateTimeField(label="Введите дату и время")

from django import forms
class UserForm(forms.Form):
    time_delta = forms.DurationField(label="Введите промежуток времени")

from django import forms
class UserForm(forms.Form):
    date_time = forms.SplitDateTimeField(label="Введите дату и время")

# Listing 6.30
from django import forms
class UserForm(forms.Form):
    num = forms.IntegerField(label="Введите целое число")

# Listing 6.31
from django import forms
class UserForm(forms.Form):
    num = forms.DecimalField(label="Введите десятичное число")


# Listing 6.32
from django import forms
class UserForm(forms.Form):
    num = forms.DecimalField(label="Введите десятичное число", decimal_places=2)


# Listing 6.33
from django import forms
class UserForm(forms.Form):
    num = forms.FloatField(label="Введите число")


from django import forms
class UserForm(forms.Form):
    ling = forms.ChoiceField(label="Выберите язык",
                             choices=((1, "Английский"),
                                      (2, "Немецкий"),
                                      (3, "Французский")))

from django import forms
class UserForm(forms.Form):
    city = forms.TypedChoiceField(label="Выберите город",
                                  empty_value=None,
                                  choices=((1, "Москва"),
                                           (2, "Воронеж"),
                                           (3, "Курск")))

from django import forms
class UserForm(forms.Form):
    country = forms.MultipleChoiceField(label="Выберите страны",
                                        choices=((1, "Англия"),
                                                 (2, "Германия"),
                                                 (3, "Испания"),
                                                 (4, "Россия")))


from django import forms
class UserForm(forms.Form):
    city = forms.TypedMultipleChoiceField(label="Выберите город",
                                          empty_value=None,
                                          choices=((1, "Москва"),
                                                   (2, "Воронеж"),
                                                   (3, "Курск"),
                                                   (4, "Томск")))

from django import forms
class UserForm(forms.Form):
    name = forms.CharField(label="Имя")
    age = forms.IntegerField(label="Возраст")
    comment = forms.CharField(label="Комментарий")

from django import forms
class UserForm(forms.Form):
    name = forms.CharField(label="Имя")
    age = forms.IntegerField(label="Возраст")
    comment = forms.CharField(label="Комментарий",
                              widget=forms.Textarea)

from django import forms
class UserForm(forms.Form):
    name = forms.CharField(label="Имя", initial="Введите ФИО")
    age = forms.IntegerField(label="Возраст", initial=18)
    comment = forms.CharField(label="Комментарий", widget=forms.Textarea)

# from django import forms
# class UserForm(forms.Form):
#     name = forms.CharField(label="Имя", initial="Введите ФИО")
#     age = forms.IntegerField(label="Возраст", initial=18)
#     field_order = ["age", "name"]

# from django import forms
# class UserForm(forms.Form):
#     name = forms.CharField(label="Имя", initial="Введите ФИО")
#     age = forms.IntegerField(label="Возраст", initial=18)

# Listing 6.45
from django import forms
class UserForm(forms.Form):
    name = forms.CharField(label="Имя", help_text ="Введите ФИО")
    age = forms.IntegerField(label="Возраст", help_text ="Введите возраст")