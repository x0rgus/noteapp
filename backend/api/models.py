from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Note(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField()
    created_at = models.DateField(auto_now_add=True) # populate automatically
    # specify user who created note using foreign key, if user deleted, remove all user related notes
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name="notes")


    def __str__(self):
        return self.title