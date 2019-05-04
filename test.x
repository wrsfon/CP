loop i-> (1,10,1)
  cmp i!=1 {
      cmp i%2!=0 {
        cmp i%3!=0 {
          cmp i%5!=0 {
            cmp i%7!=0 {
                show i.
            }.
          }.
        }.
      }.
      cmp i=2 {
          show i.
      }.
      cmp i=3 {
          show i.
      }.
      cmp i=5 {
          show i.
      }.
      cmp i=7 {
          show i.
      }.
  }.
fin.