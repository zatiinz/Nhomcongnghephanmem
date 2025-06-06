using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using QBCA.Dataccess.Entities;
namespace QBCA.Dataccess.Context; 

public partial class DemoDbcontext : DbContext
{
    public DemoDbcontext()
    {
    }

    public DemoDbcontext(DbContextOptions<DemoDbcontext> options)
        : base(options)
    {
    }

    public virtual DbSet<Exam> Exams { get; set; }

    public virtual DbSet<Notification> Notifications { get; set; }

    public virtual DbSet<Question> Questions { get; set; }

    public virtual DbSet<Subject> Subjects { get; set; }

    public virtual DbSet<AppTask> AppTasks  { get; set; }

    public virtual DbSet<User> Users { get; set; }
    
    //1
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(AppContext.BaseDirectory)
                .AddJsonFile("appsettings.json")
                .Build();

            var connectionString = configuration.GetConnectionString("DefaultConnection");
            optionsBuilder.UseSqlServer(connectionString);
        }
    }
    //1
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Exam>(entity =>
        {
            entity.HasKey(e => e.ExamId).HasName("PK__Exam__297521A78BAAB5A8");

            entity.ToTable("Exam");
            entity.Property(e => e.ExamId).HasColumnName("ExamID");
            entity.Property(e => e.DifficultyPercentage).HasMaxLength(100);
            entity.Property(e => e.ExamDate).HasColumnType("datetime");
            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");   

            entity.HasOne(d => d.Subject).WithMany(p => p.Exams)
                .HasForeignKey(d => d.SubjectId)
                .HasConstraintName("FK__Exam__SubjectID__440B1D61");
        });

        modelBuilder.Entity<Notification>(entity =>
        {
            entity.HasKey(e => e.NotificationId).HasName("PK__Notifica__20CF2E32F65B2610");

            entity.ToTable("Notification");

            entity.Property(e => e.NotificationId).HasColumnName("NotificationID");
            entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            entity.Property(e => e.IsRead).HasDefaultValue(false);
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.Notifications)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__Notificat__UserI__47DBAE45");
        });

        modelBuilder.Entity<Question>(entity =>
        {
            entity.HasKey(e => e.QuestionId).HasName("PK__Question__0DC06F8C33A96C56");

            entity.ToTable("Question");

            entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
            entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            entity.Property(e => e.DifficultyLevel).HasMaxLength(50);
            entity.Property(e => e.IsDuplicate).HasDefaultValue(false);
            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");

            entity.HasOne(d => d.CreatedByNavigation).WithMany(p => p.Questions)
                .HasForeignKey(d => d.CreatedBy)
                .HasConstraintName("FK__Question__Create__3D5E1FD2");

            entity.HasOne(d => d.Subject).WithMany(p => p.Questions)
                .HasForeignKey(d => d.SubjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Question__Subjec__3C69FB99");
        });

        modelBuilder.Entity<Subject>(entity =>
        {
            entity.HasKey(e => e.SubjectId).HasName("PK__Subject__AC1BA38831B48FBB");

            entity.ToTable("Subject");

            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");
            entity.Property(e => e.Clos).HasColumnName("CLOs");
            entity.Property(e => e.DifficultyLevel).HasMaxLength(50);
            entity.Property(e => e.SubjectName).HasMaxLength(100);
        });

        modelBuilder.Entity<AppTask>(entity =>
        {
            entity.HasKey(e => e.AppTaskId).HasName("PK__Task__7C6949D13932E9A1");

            entity.ToTable("AppTask");

            entity.Property(e => e.AppTaskId).HasColumnName("AppTaskID");
            entity.Property(e => e.DueDate).HasColumnType("datetime");
            entity.Property(e => e.Status).HasMaxLength(50);
            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");

            entity.HasOne(d => d.AssignedToNavigation).WithMany(p => p.AppTasks)
                .HasForeignKey(d => d.AssignedTo)
                .HasConstraintName("FK__Task__AssignedTo__403A8C7D");

            entity.HasOne(d => d.Subject).WithMany(p => p.AppTasks)
                .HasForeignKey(d => d.SubjectId)
                .HasConstraintName("FK__Task__SubjectID__412EB0B6");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CCAC74D9EA9C");

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.Role).HasMaxLength(50);
            entity.Property(e => e.Subject).HasMaxLength(50);
            entity.Property(e => e.Username).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

internal class Iconfiguration
{
    public object SetBasepath(string getCurrentDirectory)
    {
        throw new NotImplementedException();
    }

    public string this[string connectionstringsDefaultconnectionstrings]
    {
        get => throw new NotImplementedException();
    }
}


