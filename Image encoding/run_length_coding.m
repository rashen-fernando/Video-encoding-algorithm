function run_L_coded = run_length_coding(img_One_D_vector)
    run_L_coded= [];
    i=1;
    while (i<=size(img_One_D_vector,2))
        j=1;
        while img_One_D_vector(i)== img_One_D_vector(i+j)
            j=j+1;
            if (i+j>size(img_One_D_vector,2))
                break;
            end
        end
        run_L_coded = [run_L_coded j img_One_D_vector(i)];
        i=i+j;
    end
end



