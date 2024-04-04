import 'package:get/get.dart';

class CategoryController extends GetxController {
  final List<dynamic> categories = [
    {
      'category_title': 'pants',
      'category_name': 'بناطيل',
      'category_image':
          'data:image/jpeg;base64,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',
    },
    {
      'category_title': 't_shirts',
      'category_name': 'تشيرتات',
      'category_image':
          'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw8SEBAPDw8NEA8QEA4OEA0PDg8NDg0PFREWFhURFRUYHSghGBslGxMVITEhJykuLi8uGCA1ODMtNygtLjcBCgoKDQ0OFQ8PFSseFR0rKy0rKysrLSsrLSsrNysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAOEA4QMBIgACEQEDEQH/xAAcAAEAAgIDAQAAAAAAAAAAAAAAAQIGBwMFCAT/xABMEAACAgACBgQGDQkGBwAAAAAAAQIDBBEFBgcSITFBUWFxEyIyNIGzFBYkVXN0kZShstHS4SVCUlNicrHB8BUjVGOCojM1RISTwtP/xAAVAQEBAAAAAAAAAAAAAAAAAAAAAf/EABURAQEAAAAAAAAAAAAAAAAAAAAB/9oADAMBAAIRAxEAPwDdIAAAAAAAAAAAAAAUrtjLeUZRk4vdkk03CWWe7LLk8muAFwAAAAAHFicRCuLnZOFcFlnOyShBZvJZt8ObXynJFprNcU+TXFMCQAAAAAAAAAAAAAAAAAAAAAAAAdXp/WDCYKtW4u1Vxk3GCylOdkks3GMYptvI1hrHtislnDR9CrXFeyMRlOffGtPJd7b7gNu4vFV1Qdltlddcec7JxhBel8DANYdrmBpbhhYTxdizW+n4HD5/vtZv0Ry7TS+ltL4jEz8Jib7bpdDslmo/ux5R9CR1+8Bkus2vOkcZmrb3XS/+mozqqSz6eOcufS36DH9XdP4rCXzuw106pt+Nu5ONiT8mcHwkufNdJwTzfSfHPxZ59Evol0gbi0VtruiksVgqrGl41lFrpk31+Dkmv9x3lW2rR78rCaQj3Rw0l6xGig13fIBvx7ZdGfqsf/4qf/odXpHbdSo+5sDc59DxNtdUF25Q3m+7gaVlHu+QrkB3+tuumN0hJeyLF4OLThhq04UQa5Pdzbk+1t9mRw6D1jxuEz9iYm6mOefglLepb6c65Zx49x0qj/XWcyX4gbb1e20zWUNIYVSXJ4jC+K+91Sf8Jeg2foHWbBY2O9hMRVa8k3Wnu3Q/erfjR9KPKhaqyUZKcJSjOLzjOEnCcX1qS4r0AewAefdWdrGkMNlHE5Y2lZf8R7mIgv2bF5X+pN9pt3VPXjA6Rzjh5TjbGKnPD2wcLIrlmms4yWfSmBkoITJAAAAAAAAAAAAAABx33RhGU5yjGEIuc5yeUYxSzbb7jkNMbY9dd+UtGYaXiQa9lWRflzXFUJ9S4N9vDoYGHa/61Sx+Llas1RXnVh4PNZV58ZtfpSfF+hdBjTefIqwn+AFgABDOOytM5GQB8yTjw5r6fxLqZytFdxf1mBTe6iuT/A5dxForICsI/wBdRZIkAQ0RulgBxNHYaE0ndhb6sTRLdtqlmuqS6YS64tcGfBJ/aSB6s1X07VjcLViqeU1lODecqbF5Vcu1P5Vkztjzhsz1v/s/E7tjfsTENRvXRXLlG5d2fHs7kejK5ppNNNNJpp5pp8mBcAAAAAAAAAAADp9a9YacBhp4m3jl4tdSeUrrWvFgv5voWb6AMe2o65LA0eBpkvZl8WodLor5O59vRHt49B57bb4vNt5tt8W2+bbPt0xpS7E32YnES37bZOUnySXRGK6IpcEj4gIIfQWK5fxAsAQBJBIAqCWiGAAJzAgEoZAQCcyGBTpYAAG5djeum8lo3Ez8aKfsWyT4yguLpb6Wua7O400cmHulCUZwk4zjJSjOLylGSeaaA9epkmG7ONcIY/DrfaWJq3Y3Q5ZvosS6nl6ORmQAAAAAAAIlJJZtpJJtt8EklzA4cdjK6a53XTjCquMpznLlGK5s8269a126RxLtecaIb0MPS/zIZ8ZS/bfT8nJHe7UdenjLHhMNL3FVLjNPzuxfnfuJ8ut8eo16BIIbCYBkdKJzKJ8X2fxA5AAAAAEBgMCCQiQBAZAEkElWwKKXFrsRJRrxk+zL7P5lwAQAHa6v6Zuwd8MRS8pRfjRfk2Q/OhLsf0PI9K6r6fpxuHhfU+Elxi/KhJc4S7UeVkzJ9R9bbNH373GVFjXhqk+jlvx/aS+VcOoD00D49GaQrurhbXJShOKlGUeKknyZ9gAAADrtYtFRxeFuwk52Vxug4OdbylHin6Vw4p8Gs0+Z2IA8v63aqYrR9u5iI71cm1ViIJ+Cv7F+jLLnF/SuJ0GZ620jgKb6p0X1wtqmspVzWcX+PaaO182YXYRSxGD38RhVnKVeW9iMNHnx/WQX6S4rpXOQGugkQmTmBE3ksxX/AB4siZYCxAbCAkgkAQgySACJIDAMgIASyjLFZAVmyQRHq6gJARcCEjttAavYnGT3cPW2k8pWy8Wmvvl0vsWb7DKdS9nFuI3bcWp10vJqjJwtsX7f6uPZ5T7DdWiNC1UQjXXCEIRWUYQioxiu4DqNQtXZ4LDxpd07eLlnJKMIN84wXRHPjxb4t9ZlxWMEiwAAAAAADAA1VtF2Xq1zxmjYxja96duCSUYXPm5VdEZ9nJ9j56WlBptNNNNpqScXFrmmnyayfA9fGOYzUnR9uLeOsw8ZXuKTzbdcpLlY4cnPks31Lp4gebrdE3wqWInXKFUpKEZS4OTkm14vPLKL4nxt8DeW2TR8K9GR3UvOqeP+mw0ZPkBYlFWyyAkEZhAESQ2SBABAAAhoCSrDCQE5H36I0NbiXONCUrI7uUM1Hfzz4Jvgnw6eHaj4TPtkNWeItf6PgH9MxRgt2FsrnKqyuyFsZbkqpQlGxT6I7vPPiu/NG2dnuoPg93EYqCliOcK3k44ft7Z9vRxy6zZOK1bwd19OLsohLEUxca7Xnml0ZrlLLjlnyzeR2VGGjHkgOPB4VQS4H1JEgAAAAAAAAAAAAAA17txf5Lj8ao+rYaAkb+25v8mR+NU/UsNBMCIliIkNgSmWKxLNgQSQSBAAAAACsiYhkJgSjYexx/39/wC7h/rTNeI2BselliL1+xU/km/tJRv2rku5FylXJdxcoAAAAAAAAAAAAAAAA15tzf5Mh8bp+pYaCTN9bdpfk2rtxdXq7DQsQITIQIQF0ySokAiXRxlwAIiSABCZIEMqTIhAXM82QP3Td8FX6wwMz3ZAvdN/wdX1/wACUb/pfiouUpXiouUAAAAAAAAAAAAAAAAa327/APLqfjlfqrTQ2ZvjbxL8n0LrxcPoptNDyAqmSRHkEBIJSKsCS5xo5AKphMglACxQuBQAAWM/2Pec3r/Lqf8Av/EwCJnuyDzu34KPrESj0BTyRcpT5K7kXKAAAAAAAAAAAAAAAANabevMMN8cXqLDRM2b228+Y4b42vUWmh7HxARICYAumVZJUCyLlEXAoAABcoXAqyAALRM+2P8AndvwUPWIwCLNhbHV7quf+XX9dko37XyXcixWt8F3IsUAAAAAAAAAAAAAAAAa028+Y4b42vUWGhpvib329eZYX40/UWGh1zANkpFcy6ANkCTCQFkGyESBGYzIAFicyAAAAA2Fsel7qu+Dq+ua9NgbIPObvg6vrko3/VyXcXKU+Si5QAAAAAAAAAAAAAAABrPb2vcGGfVi16mw0Kb928156Nqf6OLrefVnVYjQjQFYIsSkTugVBbcIyAlAlIndA4wi2RCQEgnLrHDrA5Vhpc+HylZ1NcX8pXPtfyk5t9LfpzAqkZ9si84v+Dr+uzA4xM/2O0Slir91NpUJvhy/vFl/MlG+8N5KOU4sOmoo5EUSAAAAAAAAAAAAAAAD5NJ6NoxFbpxFVd1TabrsipwbXJ5M6j2iaH97cD83r+wyIAY77RND+9uB+bw+wn2jaI97MB83r+wyEAY97RtEe9mA+bV/YT7SNEe9mj/mtX2GQADoPaToj3s0d80p+wn2l6J97NHfM6PunfADp6tVNGRWUdHaPS7MHh/ukvVXRvvfo/5nh/unbgDq46uYBcsDgV3YShf+pf8AsHBf4PB/NqvsOxAHWvV/A/4LB/NqfulXq3o988DgX34Sj7p2gA6aWqejHz0do5/9nh/un16O0PhMPvexsNhsPv5b/gKK6d/LlvbqWZ9wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD/9k=',
    },
    {
      'category_title': 'shoes',
      'category_name': 'احذيه',
      'category_image':
          'data:image/jpeg;base64,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',
    },
    {
      'category_title': 'access',
      'category_name': 'اكسسوار',
      'category_image':
          'data:image/jpeg;base64,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',
    }
  ];
}
