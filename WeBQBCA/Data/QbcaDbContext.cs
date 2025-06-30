using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WeBQBCA.Data;

public partial class QbcaDbContext : DbContext
{
    public QbcaDbContext()
    {

    }
    public QbcaDbContext(DbContextOptions<QbcaDbContext> options)
        : base(options)
    {
    }
    public virtual DbSet<Accoun> Accouns { get; set; }

    public virtual DbSet<Comment> Comments { get; set; }

    public virtual DbSet<Exam> Exams { get; set; }

    public virtual DbSet<Notification> Notifications { get; set; }

    public virtual DbSet<Question> Questions { get; set; }

    public virtual DbSet<QuestionHistory> QuestionHistories { get; set; }

    public virtual DbSet<QuestionPair> QuestionPairs { get; set; }

    public virtual DbSet<ReviewTask> ReviewTasks { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Subject> Subjects { get; set; }

    public virtual DbSet<SuggestedEdit> SuggestedEdits { get; set; }

    public virtual DbSet<Task> Tasks { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserRole> UserRoles { get; set; }

    //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
    //=> optionsBuilder.UseSqlServer("Server=DESKTOP-FMTMJO6;Database=QBCA_DB;User Id=sa;Password=123;Encrypt=False;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Accoun>(entity =>
        {
            entity.HasKey(e => e.AccountId);

            entity.ToTable("Accoun");

            entity.Property(e => e.AccountId).ValueGeneratedOnAdd();//được chỉnh bằng tay
            entity.Property(e => e.PasswordHash).HasMaxLength(225);
            entity.Property(e => e.Username).HasMaxLength(50);

            //Thiết lập quang hệ khoá ngoại với user được chỉnh bằng tay
            entity.HasOne<User>() //được thêm bằng tay
            .WithMany()
            .HasForeignKey(e => e.UserId)
            .OnDelete(DeleteBehavior.Restrict);
        });

        modelBuilder.Entity<Comment>(entity =>
        {
            entity.HasKey(e => new { e.CommentsId, e.QuestionId, e.UserId });

            entity.Property(e => e.CommentsId).HasColumnName("CommentsID");
            entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.CreatedAt).HasColumnType("datetime");

            entity.HasOne(d => d.User).WithMany(p => p.Comments)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Comments_Users");
        });

        modelBuilder.Entity<Exam>(entity =>
        {
            entity.HasKey(e => e.ExamId).HasName("PK__Exam__297521A772801629");

            entity.ToTable("Exam");

            entity.Property(e => e.ExamId).HasColumnName("ExamID");
            entity.Property(e => e.DifficultyPercentage).HasMaxLength(100);
            entity.Property(e => e.ExamDate).HasColumnType("datetime");
            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");

            entity.HasOne(d => d.Subject).WithMany(p => p.Exams)
                .HasForeignKey(d => d.SubjectId)
                .HasConstraintName("FK__Exam__SubjectID__308E3499");
        });

        modelBuilder.Entity<Notification>(entity =>
        {
            entity.HasKey(e => e.NotificationId).HasName("PK__Notifica__20CF2E327FEF2553");

            entity.ToTable("Notification");

            entity.Property(e => e.NotificationId).HasColumnName("NotificationID");
            entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            entity.Property(e => e.IsRead).HasDefaultValue(false);
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.Notifications)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__Notificat__UserI__345EC57D");
        });

        modelBuilder.Entity<Question>(entity =>
        {
            entity.HasKey(e => e.QuestionId).HasName("PK__Question__0DC06F8CB24CF39F");

            entity.ToTable("Question");

            entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
            entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            entity.Property(e => e.DifficultyLevel).HasMaxLength(50);
            entity.Property(e => e.IsDuplicate).HasDefaultValue(false);
            entity.Property(e => e.Status).HasMaxLength(50);
            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");

            entity.HasOne(d => d.CreatedByNavigation)
      .WithMany(p => p.CreatedQuestions) // ✅ Đúng tên
      .HasForeignKey(d => d.CreatedBy)
      .HasConstraintName("FK__Question__Create__29E1370A");


            entity.HasOne(d => d.Subject).WithMany(p => p.Questions)
                .HasForeignKey(d => d.SubjectId)
                .IsRequired(false)//được thêm
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Question__Subjec__28ED12D1");
        });

        modelBuilder.Entity<QuestionHistory>(entity =>
        {
            entity.HasKey(e => new { e.HistoryId, e.QuestionId, e.ModifiedBy });

            entity.ToTable("QuestionHistory");

            entity.Property(e => e.HistoryId).HasColumnName("HistoryID");
            entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
            entity.Property(e => e.ModifiedData).HasColumnType("datetime");

            entity.HasOne(d => d.ModifiedByNavigation).WithMany(p => p.QuestionHistories)
                .HasForeignKey(d => d.ModifiedBy)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_QuestionHistory_Question");

            entity.HasOne(d => d.ModifiedBy1).WithMany(p => p.QuestionHistories)
                .HasForeignKey(d => d.ModifiedBy)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_QuestionHistory_Users");
        });

        modelBuilder.Entity<QuestionPair>(entity =>
        {
            entity.HasKey(e => new { e.PairId, e.Question1, e.Question2 });

            entity.Property(e => e.PairId)
                .ValueGeneratedOnAdd()
                .HasColumnName("PairID");
            entity.Property(e => e.CreatedDate)
                .HasMaxLength(10)
                .IsFixedLength();
            entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

            entity.HasOne(d => d.Pair).WithMany(p => p.QuestionPairs)
                .HasForeignKey(d => d.PairId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_QuestionPairs_Question");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.Property(e => e.RoleId).ValueGeneratedNever();
            entity.Property(e => e.RoleName).HasMaxLength(50);
        });

        modelBuilder.Entity<Subject>(entity =>
        {
            entity.HasKey(e => e.SubjectId).HasName("PK__Subject__AC1BA3884AD147EF");

            entity.ToTable("Subject");

            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");
            entity.Property(e => e.Clos).HasColumnName("CLOs");
            entity.Property(e => e.DifficultyLevel).HasMaxLength(50);
            entity.Property(e => e.SubjectName).HasMaxLength(100);
        });

        modelBuilder.Entity<SuggestedEdit>(entity =>
        {
            entity.HasKey(e => new { e.SuggestionId, e.QuestionId });

            entity.ToTable("SuggestedEdit");

            entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            entity.Property(e => e.GeneratedByAi).HasColumnName("GeneratedByAI");

            entity.HasOne(d => d.Question).WithMany(p => p.SuggestedEdits)
                .HasForeignKey(d => d.QuestionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SuggestedEdit_Question");
        });

        modelBuilder.Entity<Task>(entity =>
        {
            entity.HasKey(e => e.TaskId).HasName("PK__Task__7C6949D10F7B6172");

            entity.ToTable("Task");

            entity.Property(e => e.TaskId).HasColumnName("TaskID");
            entity.Property(e => e.DueDate).HasColumnType("datetime");
            entity.Property(e => e.Status).HasMaxLength(50);
            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");

            entity.HasOne(d => d.AssignedToNavigation).WithMany(p => p.AssignedTasks)
                .HasForeignKey(d => d.AssignedTo)
                .HasConstraintName("FK__Task__AssignedTo__2CBDA3B5");

            entity.HasOne(d => d.Subject).WithMany(p => p.Tasks)
                .HasForeignKey(d => d.SubjectId)
                .HasConstraintName("FK__Task__SubjectID__2DB1C7EE");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CCAC003FF3F4");

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.Role).HasMaxLength(50);
            //entity.Property(e => e.Subject).HasMaxLength(50);
            entity.Property(e => e.Username).HasMaxLength(50);
            entity.Property(e => e.SubjectId) //
            .HasMaxLength(20) // Hoặc đúng kiểu trong database của bạn
            .HasColumnName("SubjectID");

            entity.HasOne(d => d.Subject)
                .WithMany(p => p.Users)
                .HasForeignKey(d => d.SubjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_User_Subject");
        });

        modelBuilder.Entity<UserRole>(entity =>
        {
            entity.HasKey(e => new { e.AccountId, e.RoleId });

            entity.Property(e => e.Ghichu).HasMaxLength(50);

            entity.HasOne(d => d.Account).WithMany(p => p.UserRoles)
                .HasForeignKey(d => d.AccountId)
                .HasConstraintName("FK_UserRoles_Accoun");

            entity.HasOne(d => d.Role).WithMany(p => p.UserRoles)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK_UserRoles_Roles");
        });

        modelBuilder.Entity<ReviewTask>(entity =>
        {
            entity.HasKey(e => e.ReviewTaskId);
            entity.ToTable("ReviewTask");

            entity.Property(e => e.ReviewTaskId).HasColumnName("TaskID");
            entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.ReviewerId).HasColumnName("ReviewerID");
            entity.Property(e => e.Description).HasMaxLength(50);
            entity.Property(e => e.Tile).HasMaxLength(50);
            entity.Property(e => e.Status).HasMaxLength(50);
            entity.Property(e => e.CreatedAt)
                .HasColumnType("datetime")
                .HasColumnName("CreatedAT");

            entity.HasOne(e => e.Question)
                .WithMany(q => q.ReviewTasks)
                .HasForeignKey(e => e.QuestionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ReviewTask_Question");

            entity.HasOne(e => e.Creator)
                .WithMany(u => u.CreatedReviewTasks)
                .HasForeignKey(e => e.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ReviewTask_Creator");

            entity.HasOne(e => e.Reviewer)
                .WithMany(u => u.AssignedReviews)
                .HasForeignKey(e => e.ReviewerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ReviewTask_Reviewer");
        });




        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}