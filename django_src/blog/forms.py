from django import forms
from .models import Post, Comment



# validator 함수 정의
# title 입력필드의 길이 체크 < 3
def min_length_3_validator(value):
    if len(value) < 3:
        raise forms.ValidationError('title은 3글자 이상 입력해주세요')


# PostFrom 클래스 선언
class PostForm(forms.Form):
    # title = forms.CharField()
    title = forms.CharField(validators=[min_length_3_validator])
    text = forms.CharField(widget=forms.Textarea)


# PostModelFrom 클래스 선언
class PostModelForm(forms.ModelForm):
    # title = forms.CharField()
    # title = forms.CharField(validators=[min_length_3_validator])
    # text = forms.CharField(widget=forms.Textarea)
    class Meta:
        model = Post
        fields = ('title', 'text',)

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ('author', 'text')