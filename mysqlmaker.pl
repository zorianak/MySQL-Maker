# mysqlMaker.pl, A program that takes CSV files and puts them into
# a MySQL database

open(INFILE, $ARGV[0]);


while (<INFILE>)
{
    chomp;
    @values = split('\t', $_); #splits by tabs
    print "INSERT INTO course_info (course_id,dept,enrolled,class_name,instructor) ";
    print "values(";
    print "$values[0],"; #gets the course ID
    print "'$values[1]',"; #gets department
    #$values[3] =~ s/"/'/g; #replaces "" with '' for professors
    print "$values[3],"; #gets enrollment total
    $values[2] =~ s/[a-zA-Z]//g;
    print "$values[2],"; #gets course name/number
    print "$values[4]"; #gets faculty name
    print"); \n";
}

close (INFILE);